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
@testable import Networking
@testable import Persistence


class PostListViewModelTests: XCTestCase {
    
    var viewModel: PostListViewModel!
    
    override func setUp() {
        NetworkManager.setNetworkEnvironment(envoirnment: .getProdEnvironment())
        let dataProvider = MockDataProvider(networkingManager: NetworkManager.shared, persistence: Persistence.shared)
        viewModel = PostListViewModel(dataProvider: dataProvider)
    }
    
    func testPostsReceived() {
        viewModel.fetchAllPosts()
        XCTAssertTrue(viewModel.postsVMs.value.count == 100)
        let firstVM = viewModel.postsVMs.value.first
        XCTAssertTrue(firstVM?.title == "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
        XCTAssertTrue(firstVM?.detail == "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
    }
    
    func testAlertMessageText() {
        let errorMessage = viewModel.getPostsNotAvailableErrorMessage()
        XCTAssertTrue(errorMessage.title == "Posts Not Available")
        XCTAssertTrue(errorMessage.message == "We are unable to get latest posts at the moment, please try later!")
        XCTAssertTrue(errorMessage.actionText == "Ok")
    }
}
