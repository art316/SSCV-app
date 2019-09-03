//
//  Protocols.swift
//  SSCV
//
//  Created by dev ios on 9/1/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
import UIKit

protocol InfoProfileCellConfiguration {
    func setConfigurationFrom(_ item: Any)
}

protocol ProfileTableViewConfiguration {
    var type:ProfileTableViewType{get}
    var rowCount :Int{get}
    var selectionTitle: String{get}
    func calculatRowHeight(for indexPath: IndexPath, _ width:CGFloat) -> CGFloat
    var headerHeight: CGFloat { get }
    var cellIdeltifier: String{ get}
    func getItemFor(_ row: Int) -> Any
}
extension ProfileTableViewConfiguration{
    var rowCount : Int{
        return 1
    }
    var headerHeight: CGFloat{
        return 30
    }
}

protocol NetworkTast {
    func resume()
}

protocol  NetworkSession {
    func dataTask(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTast
    
    func dataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTast
}
