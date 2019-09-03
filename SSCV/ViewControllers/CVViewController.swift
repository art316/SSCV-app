//
//  ViewController.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import UIKit
import MessageUI


class CVViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var candidateFullNameLabel: UILabel!
    @IBOutlet weak var openPositionLabel: UILabel!
    @IBOutlet weak var contentTableView: UITableView!
    
    var profileViewModelItems : [ProfileTableViewConfiguration]!
    
    var presenter : Presenter!
    var personalInfo: PersonalInfo?
    var position = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewModelItems = [ProfileTableViewConfiguration]()
        registerCells()
        self.presenter.requestInfo()
    }
    
    func registerCells(){
        for (identifier, className) in getIdentifiersAndClassName(){
             let customNib = UINib.init(nibName: className, bundle: Bundle.main)
            self.contentTableView.register(customNib, forCellReuseIdentifier: identifier)
        }
    }
    
    func reloadViewModelWith(items: [ProfileTableViewConfiguration], info: PersonalInfo,andPosition position:String){
        self.personalInfo =  info
        self.profileViewModelItems = items
        self.position =  position
        DispatchQueue.main.async {
            self.contentTableView.reloadData()
            self.candidateFullNameLabel.text =  info.getFullName()
            self.openPositionLabel.text = position
        }
    }
    
    
    @IBAction func mailButton(_ sender: Any) {
        if self.personalInfo == nil {return}
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([ self.personalInfo!.mail])
            mail.setSubject("Globant, \(self.position)")
            mail.setMessageBody(EmailComponents.getBodyEmailMessageWithName(self.personalInfo!.name), isHTML: false)
            present(mail, animated: true)
        } else {
            self.presentAlertmessage(ErrorMessage.CantAccessMail, andCopy: self.personalInfo!.mail)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func presentAlertmessage(_ message: String, andCopy info: String){
        UIPasteboard.general.string = info
        self.presentAlertWith("", and: message)
    }
    
    @IBAction func phoneButton(_ sender: Any) {
        if self.personalInfo == nil {return}
        let phoneString =  "telprompt://\(self.personalInfo!.phone)"
        if let url = URL.init(string:phoneString){
            if UIApplication.shared.canOpenURL(url){
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler:nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }else{
                 self.presentAlertmessage(ErrorMessage.CantAccessPhoneUrl, andCopy: self.personalInfo!.phone)
            }
        }else{
            self.presentAlertmessage(ErrorMessage.CantAccessPhoneUrl, andCopy: self.personalInfo!.phone)
        }
    }
    
    func presentAlertWith(_ title: String, and Message: String){
        let alert = UIAlertController.init(title: title, message: Message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "Acccept", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension CVViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rectSize =  CGSize(width: tableView.frame.width-32, height: 1000)
        return self.profileViewModelItems[indexPath.section].calculatRowHeight(for: indexPath, rectSize.width)
    }
    
}
extension CVViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.profileViewModelItems[section].rowCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.profileViewModelItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileViewModelItems[indexPath.section].cellIdeltifier, for: indexPath)
        if cell is InfoProfileCellConfiguration{
            (cell as! InfoProfileCellConfiguration).setConfigurationFrom(profileViewModelItems[indexPath.section].getItemFor(indexPath.row))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return profileViewModelItems[section].headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = profileViewModelItems[section].selectionTitle
        if title.isEmpty{
            return nil
        }
        var headerLabel : UILabel?
        headerLabel = UILabel()
        headerLabel?.backgroundColor = .white
        headerLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        headerLabel?.textAlignment = .center
        headerLabel?.text = title
        
        return headerLabel
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

