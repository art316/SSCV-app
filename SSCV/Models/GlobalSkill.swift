//
//  Skill.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation

// MARK: - GlobalSkill
struct GlobalSkill: Codable {
    let type: String
    let skills: [Skill]
}

// MARK: - Skill
struct Skill: Codable {
    let name: String
    let proficency: Int
}

