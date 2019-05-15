//
//  PostsViewModel.swift
//  TWTask
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Networking
import UIKit
import Persistence

class PostListViewModel: NSObject {
    var posts = Dynamic([PostViewModel]())
    
    
    func fetchAllPosts() {
        NetworkManager.shared.request(request: FetchPostsRequest()) { [weak self] (response) in
            switch response {
            case .success(let dto):
                guard let self = self else {
                    return
                }
                self.mapToViewModels(dtos: dto)
                self.saveModel(model: dto!)
                break
            case .failure(let error):
                let dtos = self?.loadSaveData()
                self?.mapToViewModels(dtos: dtos)
                break
            }
            
            
        }
    }
    
    func mapToViewModels(dtos: [PostDTO]?) {
        guard let dtos = dtos else {
            return
        }
        var posts: [PostViewModel] = []
        for dto in dtos {
            let viewModel = PostViewModel(model: dto)
            posts.append(viewModel)
        }
        self.posts.value += posts
    }
    
    func saveModel(model: PostsDTO) {
        Persistence.shared.save(value: model, directory: .document, fileName: "posts.json")
    }
    
    func loadSaveData() -> PostsDTO? {
        if let postDTO: PostsDTO = Persistence.shared.reterive(directory: .document, fileName: "posts.json") {
            return postDTO
        }
        return nil
    }
}
