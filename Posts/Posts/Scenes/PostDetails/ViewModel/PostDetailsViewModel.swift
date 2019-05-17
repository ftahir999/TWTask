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
    var post: Post!
    var postVM: PostViewModel?
    var comments: Dynamic<[CommentViewModel]> = Dynamic([CommentViewModel]())
    var userViewModel: Dynamic<UserViewModel> = Dynamic(UserViewModel(model: User(id: 0, name: "", email: "", phone: "")))
    var dataProvider: DataProvider!
    var isLoadingComments = Dynamic(false)
    
    func fetchPostComments() {
        isLoadingComments.value = true
        guard let postId = post.id else {
            return
        }
        dataProvider.fetchCommentsForPost(postId: postId) { [weak self] in
            guard let self = self else { return }
            self.isLoadingComments.value = false
            self.mapCommentsViewModels(comments: $0)
        }
    }
    
    func fetchUserInfo() {
        guard let userId = post.userId else {
            return
        }
        dataProvider.fetchUserInfo(userId: userId){ [weak self] in
            guard let self = self else { return }
            self.mapUserViewModel(user: $0)
        }
    }
    
    init(post: Post, dataProvider: DataProvider) {
        self.dataProvider = dataProvider
        self.post = post
        self.postVM = PostViewModel(model: post)
    }
    
    // Private
    private func mapCommentsViewModels(comments: [Comment]?) {
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
    
    private func mapUserViewModel(user: User?) {
        guard let user = user else {
            return
        }
        userViewModel.value = UserViewModel(model: user)
    }
    
}


