//
//  EducationTableConfTest.swift
//  SSCVTests
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV

class EducationTableConfTest: XCTestCase {
    var educationConfigurator : EducationItem!
    override func setUp() {
        educationConfigurator =  EducationItem.init(educations: [Education.init(universityName: "MIT", city: "Massachusetts", country: "EUA", from: "05/2012", to: "11/2014", collegeDegree: "Biological Engineering")])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testItemCasting() {
        let education = educationConfigurator.getItemFor(0) as? Education
        XCTAssertNotNil(education, "Experience Configurator item cast fail")
    }
    
    func testHeight(){
        let height = educationConfigurator.calculatRowHeight(for: IndexPath.init(row: 0, section: 0), 0)
        XCTAssertGreaterThan(height, 0, "Experience Configurator height is less than 0")
    }

}
