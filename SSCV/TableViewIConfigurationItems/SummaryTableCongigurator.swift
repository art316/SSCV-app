//
//  SummaryTableCongiguration.swift
//  SSCV
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
import UIKit

struct SummaryItem:ProfileTableViewConfiguration{
    var cellIdeltifier: String{
        return ProfileICelldentifier.Summary
    }
    
    var type: ProfileTableViewType {
        return ProfileTableViewType.summary
    }
    var selectionTitle: String {
        return ProfileCellTitle.Summary
    }
    
    func calculatRowHeight(for indexPath: IndexPath, _ width:CGFloat) -> CGFloat{
        return SumaryTableViewCell.calculateHeightRowFrom(text: self.text, in: width).height
    }
    func getItemFor(_ row: Int) -> Any{
        return text
    }
    
    private var text: String
    
    init(text: String) {
        self.text = text
    }
}
