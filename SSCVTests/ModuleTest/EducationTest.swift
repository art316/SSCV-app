//
//  EducationTest.swift
//  SSCVTests
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV


class EducationTest: XCTestCase {
    var education : Education!
    override func setUp() {
        self.education = Education.init(universityName: "MIT", city: "Massachusetts", country: "EUA", from: "05/2012", to: "11/2014", collegeDegree: "Biological Engineering")
    }

    override func tearDown() {
        education = nil
    }

    func testLocation() {
        let locationText =  self.education.locationText()
        XCTAssertEqual(locationText, "Massachusetts,EUA", "Education location test  fail")
    }
    
    func testPeriod(){
        let periodTex = self.education.periodText()
        XCTAssertEqual(periodTex, "(May./2012 - Nov./2014)", "Education period test fail")
    }

}
