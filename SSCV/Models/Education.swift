//
//  Education.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation

// MARK: - Education
struct Education: Codable {
    let universityName, city, country, from: String
    let to, collegeDegree: String
    
    init(universityName: String, city: String, country: String, from: String, to: String, collegeDegree: String) {
        self.universityName = universityName
        self.city = city
        self.country = country
        self.from = from
        self.to = to
        self.collegeDegree = collegeDegree
    }
    
    func periodText() -> String{
        var periodText = ""
        if let period =  getPeriod(from: self.from, to: self.to){
            periodText.append(contentsOf: "\(period)")
        }
        return periodText
    }
    
    func locationText() -> String{
        return createLocation(city: self.city, country: self.country)
    }
}
