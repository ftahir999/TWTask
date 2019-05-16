//
//  PostListViewModelTests.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import XCTest
@testable import Posts

class PostListViewModelTests: XCTestCase {
    
    let dataProvider = MockDataProvider()
    
    func testPostsReceived() {
        let viewModel = PostListViewModel.init(dataProvider: dataProvider)
        viewModel.fetchAllPosts()
        XCTAssertTrue(viewModel.postsVMs.value.count == 100)
        let firstVM = viewModel.postsVMs.value.first
        XCTAssertTrue(firstVM?.title == "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
        XCTAssertTrue(firstVM?.detail == "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
    }
}
