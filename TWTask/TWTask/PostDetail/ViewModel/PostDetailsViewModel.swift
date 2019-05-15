//
//  PostDetailsViewModel.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import UIKit
import Networking

class PostDetailsViewModel: NSObject {
    var post: PostViewModel!
    var comments = Dynamic([CommentViewModel]())
    var userViewModel: Dynamic<UserViewModel>?
    var tableView: UITableView!
    
    
    func fetchPostComments() {
        let request = FetchPostCommentsRequest.init(postId: post.model.id ?? 0)
        NetworkManager.shared.request(request: request) { [weak self] (response) in
            switch response {
            case .success(let dto):
                guard let self = self else {
                    return
                }
                self.mapCommentsViewModels(dtos: dto)
                break
            case .failure(let error):
                break
            }
        }
    }
    
    func fetchUserInfo() {
        let request = UserInfoRequest.init(userId: post.model.userId ?? 0)
        NetworkManager.shared.request(request: request) { [weak self] (response) in
            switch response {
            case .success(let dto):
                guard let self = self else {
                    return
                }
                self.mapUserViewModel(dto: dto)
                break
            case .failure(let error):
                break
            }
        }
    }
    
    func mapCommentsViewModels(dtos: [Comment]?) {
        guard let dtos = dtos else {
            return
        }
        var comments = [CommentViewModel]()
        for dto in dtos {
            let viewModel = CommentViewModel(model: dto)
            comments.append(viewModel)
        }
        self.comments.value += comments
    }
    
    func mapUserViewModel(dto: User?) {
        guard let dto = dto else {
            return
        }
        userViewModel?.value = UserViewModel(model: dto)
    }
    
    override init() {
        super.init()
    }
    init(post: PostViewModel) {
        self.post = post
        super.init()
    }
    
}


