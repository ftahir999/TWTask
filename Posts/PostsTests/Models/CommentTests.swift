//
//  CommentTests.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import XCTest
@testable import Posts

class CommentTests: XCTestCase {

    func testCommentsDTO() {
        let comments = try? JSONDecoder().decode(Comments.self, from: CommentTests.loadJsonData())
        XCTAssertTrue(comments?.count == 500)
        
        let firstComment = comments?.first
        XCTAssertTrue(firstComment?.id == 1)
        XCTAssertTrue(firstComment?.postId == 1)
        XCTAssertTrue(firstComment?.email == "Eliseo@gardner.biz")
        XCTAssertTrue(firstComment?.name == "id labore ex et quam laborum")
        XCTAssertTrue(firstComment?.body == "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
    }

}
