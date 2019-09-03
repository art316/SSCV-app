//
//  SSCVServicesMockTest.swift
//  SSCVTests
//
//  Created by dev ios on 9/3/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import XCTest
@testable import SSCV

class MockNetworkTask : NetworkTast{
    func resume() {}
}
class MockNetworkSession: NetworkSession {
    func dataTask(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTast {
        guard let path =  Bundle.main.path(forResource: JSONFileNames.sscv, ofType: ".json"),
            let data = try?  Data.init(contentsOf: URL.init(fileURLWithPath: path)) else{
                completion(nil, nil, SSCVServicesError.serverError)
                return MockNetworkTask()
        }
        completion(data, nil, nil)
        return MockNetworkTask()
    }
    
    func dataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTast {
        guard let path =  Bundle.main.path(forResource: JSONFileNames.sscv, ofType: ".json"),
            let data = try?  Data.init(contentsOf: URL.init(fileURLWithPath: path)) else{
                completion(nil, nil, SSCVServicesError.serverError)
                return MockNetworkTask()
                }
        completion(data, nil, nil)
        return MockNetworkTask()
    }
}

class SSCVServicesMockTest: XCTestCase {
    var ssCVService : SSCVServices!
    override func setUp() {
        ssCVService = SSCVServices(withSession: MockNetworkSession())
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
                XCTAssertEqual(talentManifesto.profile.globalSkills.count, 3, "Mock Global Skills elements different from 3")
            case .failure(let serviceErro):
                print(serviceErro.hashValue)
                XCTFail()
            }
        }
        wait(for: [expect], timeout: 2)
    }
}
