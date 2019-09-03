//
//  PersonalInfo.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation

// MARK: - PersonalInfo
struct PersonalInfo: Codable {
    let name, lastName, mail, phone: String
    let userImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name, lastName, mail, phone
        case userImageURL = "userImageUrl"
    }
    
    init(_ name:String, lastName: String,mail: String,  phone: String, imageUrl: String) {
        self.name =  name
        self.lastName = lastName
        self.mail =  mail
        self.phone = phone
        self.userImageURL = imageUrl
    }
    
    func getFullName() ->String{
    return "\(self.name) \(self.lastName)"
    }
}
