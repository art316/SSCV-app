//
//  UIColorExtension.swift
//  SSCV
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    static var globantBlue : UIColor {
        return UIColor.blue.withAlphaComponent(0.4)
    }
}

extension DateFormatter{
    static var serviceDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yyyy"
        return dateFormatter
    }
    static var customDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM./yyyy"
        return dateFormatter
    }
}

extension URLSessionDataTask: NetworkTast {}

extension URLSession :NetworkSession{
    func dataTask(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTast{
        return dataTask(with: request, completionHandler: completion)
    }
    
    func dataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTast{
        return dataTask(with: url, completionHandler: completion)
    }
}
