//
//  SSCVServicesTest.swift
//  SSCVTests
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV


class SSCVServicesTest: XCTestCase {
    var ssCVService : SSCVServices!
    override func setUp() {
        ssCVService = SSCVServices(withSession: URLSession.shared)
    }

    override func tearDown() {
        ssCVService =  nil
    }

    func testLoadCV() {
        let expect = expectation(description: "loadCV")
        ssCVService.loadCVFromUrlString(ProfileUrls.sscv) { (result) -> (Void) in
            expect.fulfill()
            switch result{
            case .success(let talentManifesto):
                XCTAssertNotNil(talentManifesto)
                XCTAssertEqual(talentManifesto.profile.education.count, 1, "Education elements different from 1")
            case .failure(let serviceErro):
                print(serviceErro.hashValue)
                XCTFail()
            }
        }
        wait(for: [expect], timeout: 2)
    }
}
