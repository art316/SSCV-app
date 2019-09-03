//
//  ImageTableViewConfigurator.swift
//  SSCV
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
import UIKit

struct ImageProfileItem:ProfileTableViewConfiguration{
    var cellIdeltifier: String{
        return ProfileICelldentifier.Image
    }
    
    var type: ProfileTableViewType {
        return ProfileTableViewType.imageProfile
    }
    var selectionTitle: String {
        return ProfileCellTitle.Image
    }
    
    var headerHeight: CGFloat{
        return 0
    }
    
    func calculatRowHeight(for indexPath: IndexPath, _ width:CGFloat) -> CGFloat{
        return CGFloat(ProfileCellHeight.image)
    }
    
    func getItemFor(_ row: Int) -> Any{
        return imageUrl
    }
    
    private var imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
}
