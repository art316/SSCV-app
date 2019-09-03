//
//  Experience.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
import UIKit


// MARK: - Experience
struct Experience: Codable {
    let name, from, to: String
    let isCurrentJob: Bool
    let city, country, position: String
    let achivements: [String]
    
    init(name: String, from: String, to: String, isCurrentJob: Bool, city: String, country: String, position: String, achivements: [String]) {
        self.name = name
        self.from = from
        self.to = to
        self.isCurrentJob = isCurrentJob
        self.city = city
        self.country = country
        self.position = position
        self.achivements = achivements
    }
    
    func completeAttributedText() -> NSAttributedString{
        var text = self.position
        if isCurrentJob,  let stringFromDate = getStringDateFromString(serviceDate: self.from){
            text.append(contentsOf: "\n(\(stringFromDate) - Present)")
        }else if let period =  getPeriod(from: self.from, to: self.to){
            text.append(contentsOf: "\n\(period)")
        }
        text.append("\n\(self.name), \(createLocation(city: self.city, country: self.country))")
        var achivementsText = ""
        for achivement in achivements{
            achivementsText.append("\n• \(achivement)")
        }
        text.append(achivementsText)
        let posiTionRange =  NSString.init(string: text).range(of: self.position)
        let achivementsRange =  NSString.init(string: text).range(of: achivementsText)
        
        let attributedText = NSMutableAttributedString.init(string: text, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])
        
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .semibold), range:posiTionRange)
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .semibold), range:achivementsRange)
        
        return attributedText
    }
    
}
