//
//  MockDataProvider.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import XCTest
@testable import Posts

class MockDataProvider: DataProvider {
    
    override func fetchUserInfo(userId: Int, handler: @escaping UserInfoHandler) {
        let data = try? JSONDecoder().decode(User.self, from: UserTests.loadJsonData())
        handler(data)
    }
    
    override func fetchPosts(handler: @escaping AllPostsHandler) {
        let data = try? JSONDecoder().decode(Posts.self, from: PostTests.loadJsonData())
        handler(data)
    }
    
    override func fetchCommentsForPost(postId: Int, handler: @escaping PostCommentsHandler) {
        let data = try? JSONDecoder().decode(Comments.self, from: CommentTests.loadJsonData())
        handler(data)
    }
    
}
