//
//  GlobalSkillTableConfTest.swift
//  SSCVTests
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV


class GlobalSkillTableConfTest: XCTestCase {
    var globalSkillConfigutaror : SkillsItem!
    override func setUp() {
        globalSkillConfigutaror =  SkillsItem.init(globalSkills: [GlobalSkill.init(type: "Personal", skills: [Skill.init(name: "Team work", proficency: 0),Skill.init(name: "Public speaking", proficency: 5)])])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testItemCasting() {
        let globalSkill = globalSkillConfigutaror.getItemFor(0) as? GlobalSkill
        XCTAssertNotNil(globalSkill, "Global Skill Configurator item cast fail")
    }
    
    func testHeight(){
        let height = globalSkillConfigutaror.calculatRowHeight(for: IndexPath.init(row: 0, section: 0), 750)
        XCTAssertGreaterThan(height, 0, "Global Skill Configurator height is less than 0")
    }

}
