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
    var dataProvider: DataProvider?
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    
    func fetchAllPosts() {        
        dataProvider?.fetchPosts() { (posts) in
            guard let posts = posts else {
                return
            }
            self.mapToViewModels(posts: posts)
        }
    }
    
    func mapToViewModels(posts: [Post]) {
        var postVMs: [PostViewModel] = []
        for post in posts {
            let viewModel = PostViewModel(model: post)
            postVMs.append(viewModel)
        }
        self.postsVMs.value += postVMs
    }
    
}
