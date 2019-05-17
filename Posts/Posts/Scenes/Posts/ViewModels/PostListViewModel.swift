//
//  PostsViewModel.swift
//  TWTask
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Networking
import Persistence
import Common

class PostListViewModel {
    var postsVMs = Dynamic([PostViewModel]())
    var isLoadingData = Dynamic(false)
    var displayErrorMessage = Dynamic(false)
    var dataProvider: DataProvider?
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    
    func fetchAllPosts() {
        isLoadingData.value = true
        dataProvider?.fetchPosts() { [weak self] (posts) in
            guard let self = self else {
                return
            }
            self.isLoadingData.value = false
            guard let posts = posts else {
                self.displayErrorMessage.value = true
                return
            }
            self.mapToViewModels(posts: posts)
        }
    }
    
    func getPostsNotAvailableErrorMessage() -> (title: String, message: String, actionText: String) {
        return (title: "Posts Not Available", message: "We are unable to get latest posts at the moment, please try later!", actionText: "Ok")
    }
    
    // Private    
    private func mapToViewModels(posts: [Post]) {
        var postVMs: [PostViewModel] = []
        for post in posts {
            let viewModel = PostViewModel(model: post)
            postVMs.append(viewModel)
        }
        self.postsVMs.value += postVMs
    }
    
}
