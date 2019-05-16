//
//  PostDetailsViewModelTests.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//
import Foundation
import XCTest
@testable import Posts

class PostDetailsViewModelTests: XCTestCase {
    
    let dataProvider = MockDataProvider()
    var viewModel: PostDetailsViewModel = PostDetailsViewModel()
    
    override func setUp() {
        viewModel.dataProvider = dataProvider
        viewModel.post = Post(userId: 1, id: 1, title: "", body: "")
    }
    
    func testCommentsReceived() {
        viewModel.fetchPostComments()
        XCTAssertTrue(viewModel.comments.value.count == 500)        
        let firstVM = viewModel.comments.value.first
        XCTAssertTrue(firstVM?.name == "id labore ex et quam laborum")
        XCTAssertTrue(firstVM?.comment == "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
        XCTAssertTrue(firstVM?.email == "Eliseo@gardner.biz")
    }
    
    func testUserModelReceived() {
        viewModel.fetchUserInfo()
        let userModel = viewModel.userViewModel?.value
        XCTAssertTrue(userModel?.name == "Leanne Graham")
        XCTAssertTrue(userModel?.email == "Sincere@april.biz")
    }
}
