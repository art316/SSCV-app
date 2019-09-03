//
//  Presenter.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
import UIKit

class Presenter{
    weak var view: CVViewController?
     private var talentManifesto : TalentManifesto?
    private var profileViewModelItems : [ProfileTableViewConfiguration]?
    
    static func createView() -> CVViewController{
        let view = UIStoryboard.init(name: StoryboardNames.MainStoryboar, bundle: Bundle.main).instantiateViewController(withIdentifier: ViewControllerIdentifiers.cvViewController) as! CVViewController
        view.presenter = Presenter(view: view)
        return view
    }
    
    init(view: CVViewController) {
        self.view = view 
    }
    
   private func displayProfileViewModelsWith(_  talentManifesto: TalentManifesto){
        let imageProfileItem = ImageProfileItem.init(imageUrl: talentManifesto.profile.personalInfo.userImageURL)
        let summaryItem = SummaryItem.init(text: talentManifesto.profile.summary)
        let skillsItem = SkillsItem.init(globalSkills: talentManifesto.profile.globalSkills)
        let experienceItem = ExperienceItem.init(talentManifesto.profile.experience)
        let educationItem = EducationItem.init(educations: talentManifesto.profile.education)
        let profileViewModelItems : [ProfileTableViewConfiguration] = [imageProfileItem,summaryItem,skillsItem, experienceItem, educationItem]
        self.profileViewModelItems = profileViewModelItems
    }
    
    private func reloadViewInfo(){
        self.view?.reloadViewModelWith(items: profileViewModelItems!, info: self.talentManifesto!.profile.personalInfo, andPosition: self.talentManifesto!.position)
    }
    
    func requestInfo(){
        let ssCVService =  SSCVServices.init(withSession: URLSession.shared)
        ssCVService.loadCVFromUrlString(ProfileUrls.sscv) { (result) -> (Void) in
            switch result{
                
            case .success(let talentMnifesto):
                self.talentManifesto = talentMnifesto
                self.displayProfileViewModelsWith(talentMnifesto)
                self.reloadViewInfo()
                
            case .failure(let error):
                var message =  ""
                switch error{
                case .InvalidUrl:
                    message = ErrorMessage.RequestError
                case .serverError:
                    message = ErrorMessage.ServiceError
                case .requestError:
                    message = ErrorMessage.RequestError
                case.jsonError:
                    message =  ErrorMessage.JSONError
                }
                self.view?.presentAlertWith("", and:message)
            }
        }
    }
}
