//
//  GlobalSkillTableConfigurator.swift
//  SSCV
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
import UIKit

struct SkillsItem:ProfileTableViewConfiguration{
    var cellIdeltifier: String{
        return ProfileICelldentifier.Skill
    }
    
    var type: ProfileTableViewType {
        return ProfileTableViewType.skills
    }
    var selectionTitle: String {
        return ProfileCellTitle.Skills
    }
    var rowCount : Int{
        return self.globalSkills.count
    }
    func calculatRowHeight(for indexPath: IndexPath, _ width:CGFloat) -> CGFloat{
        return SkillTableViewCell.getCellHeightForElements(self.globalSkills[indexPath.row].skills.count)
    }
    
    func getItemFor(_ row: Int) -> Any{
        return globalSkills[row]
    }
    
    private var globalSkills: [GlobalSkill]
    
    init(globalSkills: [GlobalSkill]) {
        self.globalSkills = globalSkills
    }
}
