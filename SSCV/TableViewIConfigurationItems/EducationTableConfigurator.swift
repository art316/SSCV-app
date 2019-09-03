//
//  EducationTableConfigurator.swift
//  SSCV
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
import UIKit

struct EducationItem:ProfileTableViewConfiguration{
    var cellIdeltifier: String{
        return ProfileICelldentifier.Education
    }
    
    var type: ProfileTableViewType {
        return ProfileTableViewType.education
    }
    var selectionTitle: String {
        return ProfileCellTitle.Education
    }
    var rowCount : Int{
        return self.educations.count
    }
    
    func calculatRowHeight(for indexPath: IndexPath, _ width:CGFloat) -> CGFloat{
        return CGFloat(ProfileCellHeight.education)
    }
    
    func getItemFor(_ row: Int) -> Any{
        return educations[row]
    }
    
    private var educations: [Education]
    
    init(educations: [Education]) {
        self.educations = educations
    }
}
