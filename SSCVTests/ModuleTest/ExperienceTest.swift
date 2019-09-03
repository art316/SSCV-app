//
//  ExperienceTest.swift
//  SSCVTests
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV


class ExperienceTest: XCTestCase {
    var experience :  Experience!
    override func setUp() {
        experience = Experience.init(name: "Demzou Ltd", from: "06/2018", to: "01/2019", isCurrentJob: false, city: "London", country: "UK", position: "Freelance Senior Design Consultant", achivements: ["Working as a consultant for different clients", "Offering various design services including design strategy", "research, service design and UX/UI"])
    }

    override func tearDown() {
        experience = nil
    }

    func testCurrentJob() {
        let text =  experience.completeAttributedText().string
        XCTAssertFalse(text.contains("Present"))
    }
    
    func testLocationFormat(){
        let locationText = createLocation(city: experience.city, country: experience.country)
        XCTAssertEqual(locationText, "London,UK", "Error in location format")
    }
    
    func testDateFormat(){
        let dateText = getStringDateFromString(serviceDate: experience.from)
        XCTAssertEqual(dateText, "Jun./2018", "Error in location format")
    }
    
    func testPeriodFormat(){
        let dateText = getPeriod(from: experience.from, to:experience.to )
        XCTAssertEqual(dateText, "Jun./2018 - Jan./2019", "Error in period format")
    }

}
