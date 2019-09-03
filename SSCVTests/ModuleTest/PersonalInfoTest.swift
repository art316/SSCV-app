//
//  SSCVTests.swift
//  SSCVTests
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV

class PersonalInfoTests: XCTestCase {
    var personalInfo : PersonalInfo!

    override func setUp() {
        personalInfo = PersonalInfo.init("fisrc Name", lastName: "lastName", mail: "", phone: "", imageUrl: "")
    }

    override func tearDown() {
        personalInfo = nil
    }

    func testFullName() {
        let fullName = "fisrt Name lastName"
        XCTAssertEqual(personalInfo.getFullName(), fullName, "incorrect full name format")
    }
}
