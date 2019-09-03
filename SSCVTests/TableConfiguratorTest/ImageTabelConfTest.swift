//
//  ImageTabelConfTest.swift
//  SSCVTests
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV

class ImageTabelConfTest: XCTestCase {
    var imageConfigurator : ImageProfileItem!

    override func setUp() {
        imageConfigurator = ImageProfileItem.init(imageUrl: "https://www.globant.com/themes/custom/globant_corp_theme/images/2019/globant-logo-dark.svg")
    }

    override func tearDown() {
        imageConfigurator =  nil
    }

    func testItemCasting() {
        let imageUrl = imageConfigurator.getItemFor(0) as? String
        XCTAssertNotNil(imageUrl, "Image Configurator item cast fail")
    }
    
    func testHeight(){
        let height = imageConfigurator.calculatRowHeight(for: IndexPath.init(row: 0, section: 0), 0)
        XCTAssertGreaterThan(height, 0, "Image Configurator height is less than 0")
    }
}
