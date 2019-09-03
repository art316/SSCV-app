//
//  SkillTableViewCell.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import UIKit
class SkillsView: UIView{
    
}

class SkillTableViewCell: UITableViewCell, InfoProfileCellConfiguration {

    @IBOutlet weak var sklillTitleLabel: UILabel!
    @IBOutlet weak var customBackgroundView: UIView!
    
    let fontSize : CGFloat = 16
    var skills  = [Skill]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.customBackgroundView.backgroundColor = UIColor.globantBlue
        self.customBackgroundView.layer.cornerRadius = 10
    }
    
    func setGlobalSkill(_ globalSkill: GlobalSkill) {
        self.skills = globalSkill.skills.sorted(by: {$0.proficency > $1.proficency})
        DispatchQueue.main.async {
            self.sklillTitleLabel.text = globalSkill.type
            self.createSkillsElements()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static  func getCellHeightForElements(_ elements:Int) -> CGFloat{
        var totalHeight : CGFloat = 0
        let defaultHeight : CGFloat = 10 +  24 + 20
        totalHeight = defaultHeight
        
        let elementsCounts = CGFloat(elements)
        if elementsCounts > 0 {
            let dynamicHeight : CGFloat = 8 + CGFloat(22*elementsCounts) + CGFloat(6*(elementsCounts-1))
            totalHeight += dynamicHeight
        }
        return totalHeight
    }
    
    func setConfigurationFrom(_ item: Any) {
        if let globalKill = item as? GlobalSkill{
            self.setGlobalSkill(globalKill)
        }
    }
    
    func createSkillsElements(){
        for subView in self.subviews{
            if (subView as? SkillsView) != nil{
                subView.removeFromSuperview()
            }
        }
        for (index,skill) in self.skills.enumerated(){
            addViewtWith(number:index, title: skill.name, andValue: skill.proficency)
        }
    }
    
    func addViewtWith(number: Int, title: String, andValue value: Int){
        let newView =  createSkillElementWith(title: title, andValue: value)
        self.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.leadingAnchor.constraint(equalTo: sklillTitleLabel.leadingAnchor).isActive = true
        let topAnchoreConstant  : CGFloat = 8 + CGFloat((22+6)*number)
        newView.topAnchor.constraint(equalTo: sklillTitleLabel.bottomAnchor, constant:topAnchoreConstant) .isActive = true
        newView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        newView.trailingAnchor.constraint(equalTo: sklillTitleLabel.trailingAnchor).isActive = true
    }
    
    private func createSkillElementWith(title: String, andValue value: Int) -> UIView{
        let elementView = SkillsView.init(frame: CGRect.init(x: 0, y: 0, width: 120, height: 22))
        let titleLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 60, height: 22))
        titleLabel.font = UIFont.systemFont(ofSize: fontSize)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.text = "• \(title)"
        
        elementView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: elementView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: elementView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: elementView.centerXAnchor).isActive = true
        
        titleLabel.heightAnchor.constraint(equalTo: elementView.heightAnchor).isActive = true
        
        if value <= 0 || value > 10{
            return elementView
        }
        
        let topLevelLabel = self.createSquareLabelWithText("10")
        let jointLabel = self.createSquareLabelWithText("of")
        let circleView = self.createCircelViewWithColor(.white)
        let proficencyLevel = self.createSquareLabelWithText("\(value)")
        elementView.addSubview(topLevelLabel)
        elementView.addSubview(jointLabel)
        elementView.addSubview(circleView)
        elementView.addSubview(proficencyLevel)
        
        topLevelLabel.translatesAutoresizingMaskIntoConstraints = false
        topLevelLabel.centerYAnchor.constraint(equalTo: elementView.centerYAnchor).isActive = true
        topLevelLabel.widthAnchor.constraint(equalTo: elementView.heightAnchor).isActive = true
        topLevelLabel.trailingAnchor.constraint(equalTo: elementView.trailingAnchor, constant: 0).isActive = true
        topLevelLabel.heightAnchor.constraint(equalTo: elementView.heightAnchor).isActive = true
        
        jointLabel.translatesAutoresizingMaskIntoConstraints = false
        jointLabel.centerYAnchor.constraint(equalTo: elementView.centerYAnchor).isActive = true
        jointLabel.widthAnchor.constraint(equalTo: elementView.heightAnchor).isActive = true
        jointLabel.trailingAnchor.constraint(equalTo: topLevelLabel.leadingAnchor).isActive = true
        jointLabel.heightAnchor.constraint(equalTo: elementView.heightAnchor).isActive = true
        
        
        proficencyLevel.translatesAutoresizingMaskIntoConstraints = false
        proficencyLevel.centerYAnchor.constraint(equalTo: elementView.centerYAnchor).isActive = true
        proficencyLevel.widthAnchor.constraint(equalTo: elementView.heightAnchor).isActive = true
        proficencyLevel.trailingAnchor.constraint(equalTo: jointLabel.leadingAnchor, constant: -4).isActive = true
        proficencyLevel.heightAnchor.constraint(equalTo: elementView.heightAnchor).isActive = true
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.centerYAnchor.constraint(equalTo: proficencyLevel.centerYAnchor).isActive = true
        circleView.centerXAnchor.constraint(equalTo: proficencyLevel.centerXAnchor).isActive = true
        circleView.widthAnchor.constraint(equalTo: proficencyLevel.heightAnchor).isActive = true
        circleView.heightAnchor.constraint(equalTo: proficencyLevel.heightAnchor).isActive = true
        
        return elementView
    }
    
    private func createSquareLabelWithText(_ text: String) -> UILabel{
        let objectLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
        objectLabel.font = UIFont.systemFont(ofSize: fontSize)
        objectLabel.text = text
        objectLabel.textAlignment = .center
        return objectLabel
    }
    
    private func createCircelViewWithColor(_ color: UIColor) -> UIView{
        let objectView = UIView.init(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
        objectView.backgroundColor = color
        objectView.layer.cornerRadius = objectView.frame.height/2
        return objectView
    }
    
}
