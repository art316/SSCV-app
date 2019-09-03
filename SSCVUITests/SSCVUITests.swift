//
//  SSCVUITests.swift
//  SSCVUITests
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved./Users/devios/Documents/SSCV/SSCV/SSCVUITests
//

import XCTest

class SSCVUITests: XCTestCase {
    
    var aplication : XCUIApplication!

    override func setUp() {
        aplication = XCUIApplication()
        
        continueAfterFailure = false

        aplication.launch()
    }

    override func tearDown() {
        aplication = nil
    }
    
    func testSummaryHeader() {
        let tablesQuery = XCUIApplication().tables
       XCTAssertTrue( tablesQuery.otherElements.staticTexts["Summary"].exists)
        
    }
    func testSKillsHeader() {
        let tablesQuery = XCUIApplication().tables
        XCTAssertTrue( tablesQuery.otherElements.staticTexts["Skills"].exists)
    }
    
    func testProfileImage(){
                XCTAssertTrue(aplication.images.element.exists)
    }

    func testTapMail() {
        aplication.buttons["mail"].tap()
        XCTAssertTrue(aplication.alerts.element.exists)

    }
    func testTapPhone() {
        aplication.buttons["phone"].tap()
        XCTAssertTrue(aplication.alerts.element.exists)
    }
}
