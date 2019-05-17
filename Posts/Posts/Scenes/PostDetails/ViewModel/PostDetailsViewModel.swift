//
//  PostDetailsViewModel.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Networking
import Common

class PostDetailsViewModel {
    var postVM: PostViewModel?
    var comments: Dynamic<[CommentViewModel]> = Dynamic([CommentViewModel]())
    var userViewModel: Dynamic<UserViewModel> = Dynamic(UserViewModel.init(model: User(id: 0, name: "", email: "", phone: "")))
    var dataProvider: DataProvider!
    var post: Post!
    
    
    func fetchPostComments() {
        guard let postId = post.id else {
            return
        }
        dataProvider.fetchCommentsForPost(postId: postId) { (comments) in
            self.mapCommentsViewModels(comments: comments)
        }
    }
    
    func fetchUserInfo() {
        guard let userId = post.userId else {
            return
        }
        dataProvider.fetchUserInfo(userId: userId){ (user) in
            self.mapUserViewModel(user: user)
        }
    }
    
    func mapCommentsViewModels(comments: [Comment]?) {
        guard let comments = comments else {
            return
        }
        var commentVMs = [CommentViewModel]()
        for comment in comments {
            let viewModel = CommentViewModel(model: comment)
            commentVMs.append(viewModel)
        }
        self.comments.value += commentVMs
    }
    
    func mapUserViewModel(user: User?) {
        guard let user = user else {
            return
        }
        userViewModel.value = UserViewModel(model: user)
    }
    
    init(post: Post, dataProvider: DataProvider) {
        self.dataProvider = dataProvider
        self.post = post
        self.postVM = PostViewModel(model: post)
    }
    
}


