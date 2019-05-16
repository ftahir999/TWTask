//
//  UserInfoRequest.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import XCTest
@testable import Posts
@testable import Networking

class UserInfoRequestTests: XCTestCase {
    
    func testFetchUserInfoRequest() {
        let request = UserInfoRequest(userId: 1)
        XCTAssertTrue(request.endpoint.path == "/users/1")
        XCTAssertTrue(request.endpoint.method == HttpMethod.get)
        XCTAssertTrue(request.endpoint.query == [:])
        XCTAssertNil(request.endpoint.body)
    }
}
