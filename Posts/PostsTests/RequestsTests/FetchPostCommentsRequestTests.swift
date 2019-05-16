//
//  FetchPostCommentsRequestTests.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import XCTest
@testable import Posts
@testable import Networking

class FetchPostCommentsRequestTests: XCTestCase {
    
    func testFetchPostCommentRequest() {
        let request = FetchPostCommentsRequest.init(postId: 1)
        XCTAssertTrue(request.endpoint.path == "/posts/1/comments")
        XCTAssertTrue(request.endpoint.method == HttpMethod.get)
        XCTAssertTrue(request.endpoint.query == [:])
        XCTAssertNil(request.endpoint.body)
        
    }
}
