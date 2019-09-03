//
//  ExperienceTableConfTest.swift
//  SSCVTests
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV


class ExperienceTableConfTest: XCTestCase {
    var experienceConfigurator : ExperienceItem!

    override func setUp() {
        experienceConfigurator =  ExperienceItem.init([Experience.init(name: "Demzou Ltd", from: "06/2018", to: "01/2019", isCurrentJob: false, city: "London", country: "UK", position: "Freelance Senior Design Consultant", achivements: ["Working as a consultant for different clients", "Offering various design services including design strategy", "research, service design and UX/UI"])])
    }

    override func tearDown() {
        experienceConfigurator =  nil
    }

    func testItemCasting() {
        let attriobutedText = experienceConfigurator.getItemFor(0) as? NSAttributedString
        XCTAssertNotNil(attriobutedText, "Experience Configurator item cast fail")
    }
    
    func testHeight(){
        let height = experienceConfigurator.calculatRowHeight(for: IndexPath.init(row: 0, section: 0), 750)
        XCTAssertGreaterThan(height, 0, "Experience Configurator height is less than 0")
    }

}
