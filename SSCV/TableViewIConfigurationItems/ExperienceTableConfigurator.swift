//
//  ExperienceTableConfiguration.swift
//  SSCV
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
import UIKit

struct ExperienceItem:ProfileTableViewConfiguration{
    var cellIdeltifier: String{
        return ProfileICelldentifier.Summary
    }
    
    var type: ProfileTableViewType {
        return ProfileTableViewType.experience
    }
    var selectionTitle: String {
        return ProfileCellTitle.Experience
    }
    var rowCount : Int{
        return self.experiences.count
    }
    func calculatRowHeight(for indexPath: IndexPath, _ width:CGFloat) -> CGFloat{
        return SumaryTableViewCell.calculateHeightRowFrom(text: self.experiences[indexPath.row].completeAttributedText(), in: width).height
    }
    
    func getItemFor(_ row: Int) -> Any{
        return experiences[row].completeAttributedText()
    }
    
    private var experiences: [Experience]
    
    init(_ experiences: [Experience]) {
        self.experiences = experiences
    }
}
