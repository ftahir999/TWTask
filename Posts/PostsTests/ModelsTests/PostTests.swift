//
//  PostTests.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import XCTest
@testable import Posts

class PostTests: XCTestCase {
    func testPostsDTO() {
        let posts = try? JSONDecoder().decode(Posts.self, from: PostTests.loadJsonData())
        XCTAssertTrue(posts?.count == 100)
        
        let firstPost = posts?.first
        XCTAssertTrue(firstPost?.id == 1)
        XCTAssertTrue(firstPost?.userId == 1)
        XCTAssertTrue(firstPost?.title == "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
         XCTAssertTrue(firstPost?.body == "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
    }
}
