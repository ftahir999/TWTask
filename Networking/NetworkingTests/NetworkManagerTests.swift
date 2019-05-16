//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Farhan Tahir on 15/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import XCTest
@testable import Networking

class NetworkingTests: XCTestCase {
    
    func testValidRequestURL() {
        let request = DummyRequest.init(path: "/path")
        XCTAssertNotNil(request.endpoint.asURLRequest)
    }
    
    func testInValidRequestURL() {
        let request = DummyRequest.init(path: "\\////path")
        XCTAssertNil(request.endpoint.asURLRequest())
    }
    
    func testInValidRequestError() {
        let request = DummyRequest.init(path: "\\////path")
        MockNetworkManager.shared.request(request: request) { (response) in
            switch response {
            case .failure(let error):
                XCTAssertTrue(error! == NetworkError.invalidRequest)
            case .success(_):
                XCTAssertFalse(true)
            }
        }
    }
    
    func testValidDataReturned() {
        let request = DummyRequest.init(path: "/path")
        let manager = MockNetworkManager()
        manager.response = DummyData(response: "asdfasdf")
        manager.request(request: request) { (response) in
            switch response {
            case .success(let dummyDTO):
                XCTAssertNotNil(dummyDTO)
            default:
                break
            }
        }
    }
    
    func testInValidDataFound() {
        let request = DummyRequest.init(path: "/path")
        let manager = MockNetworkManager()
        manager.response = nil
        manager.request(request: request) { (response) in
            switch response {
            case .failure(let error):
                XCTAssertNotNil(error)
            default:
                break
            }
        }
    }

}
