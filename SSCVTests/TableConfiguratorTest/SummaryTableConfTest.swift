//
//  SummaryTableConfTest.swift
//  SSCVTests
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV


class SummaryTableConfTest: XCTestCase {
    var summaryConfigurator : SummaryItem!

    override func setUp() {
        summaryConfigurator =  SummaryItem.init(text: "First of all, let’s quickly go over what sections I have on my résumé. Then, we’ll go over each of them in turn to talk about them in more detail.")
    }

    override func tearDown() {
        summaryConfigurator =  nil
    }

    func testItemCasting() {
        let summaryText = summaryConfigurator.getItemFor(0) as? String
        XCTAssertNotNil(summaryText, "Summary Configurator item cast fail")
    }

    func testHeight(){
        let height = summaryConfigurator.calculatRowHeight(for: IndexPath.init(row: 0, section: 0), 750)
        XCTAssertGreaterThan(height, 0, "Image Configurator height is less than 0")
    }

}
