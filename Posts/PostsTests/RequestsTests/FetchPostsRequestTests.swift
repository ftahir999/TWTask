//
//  FetchPostsRequest.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import XCTest
@testable import Posts
@testable import Networking

class FetchPostsRequestTests: XCTestCase {
    
    func testFetchPostsRequest() {
        let request = FetchPostsRequest()
        XCTAssertTrue(request.endpoint.path == "/posts")
        XCTAssertTrue(request.endpoint.method == HttpMethod.get)
        XCTAssertTrue(request.endpoint.query == [:])
        XCTAssertNil(request.endpoint.body)
    }
}
