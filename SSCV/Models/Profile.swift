//
//  Profile.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
// MARK: - Profile
struct Profile: Codable {
    let personalInfo: PersonalInfo
    let summary: String
    let globalSkills: [GlobalSkill]
    let experience: [Experience]
    let education: [Education]
}
