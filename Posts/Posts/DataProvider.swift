//
//  DataRepositry.swift
//  TWTask
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Networking
import Persistence

public typealias AllPostsHandler = (Posts?) -> Void
public typealias PostCommentsHandler = (Comments?) -> Void
public typealias UserInfoHandler = (User?) -> Void

public class DataProvider {
    
    private let networkingManager: NetworkManager
    private let persistence: Persistence
    
    func fetchPosts(handler: @escaping AllPostsHandler) {
        let fileName = FilePath.posts.path()
        let request = FetchPostsRequest()
        networkingManager.request(request: request) { [weak self] (response) in
            switch response {
            case .success(let dto):
                guard let self = self else {
                    return
                }
                
                guard let dto = dto else {
                    let cachedModel: Posts? = self.loadSaveData(fileName: fileName)
                    handler(cachedModel)
                    return
                }
                self.saveModel(model: dto, fileName: fileName)
                handler(dto)                
            case .failure(_):
                handler(nil)
                break
            }
        }
    }
    
    func fetchCommentsForPost(postId: Int, handler: @escaping PostCommentsHandler) {
        let fileName = FilePath.postComments(postId: postId).path()
        let request = FetchPostCommentsRequest(postId: postId)
        networkingManager.request(request: request) { [weak self] (response) in
            switch response {
            case .success(let dto):
                guard let self = self else {
                    return
                }
                guard let dto = dto else {
                    let cachedModel: Comments? = self.loadSaveData(fileName: fileName)
                    handler(cachedModel)
                    return
                }
                self.saveModel(model: dto, fileName: fileName)
                handler(dto)
            case .failure(_):
                handler(nil)
                break
            }
        }
    }
    
    func fetchUserInfo(userId: Int, handler: @escaping UserInfoHandler) {
        let fileName = FilePath.userInfo(userId: userId).path()
        let request = UserInfoRequest(userId: userId)
        networkingManager.request(request: request) { [weak self] (response) in
            switch response {
            case .success(let dto):
                guard let self = self else {
                    return
                }
                
                guard let dto = dto else {
                    let cachedModel: User? = self.loadSaveData(fileName: fileName)
                    handler(cachedModel)
                    return
                }
                self.saveModel(model: dto, fileName: fileName)
                handler(dto)
            case .failure(_):
                handler(nil)
                break
            }
        }
    }
    
    public init(networkingManager: NetworkManager, persistence: Persistence) {
        self.networkingManager = networkingManager
        self.persistence = persistence
    }
    
    //Private Methods
    private func saveModel<T: Codable>(model: T, fileName: String) {
        persistence.save(value: model, directory: .document, fileName: fileName)
    }
    
    private func loadSaveData<T: Codable>(fileName: String) -> T? {
        if let model: T = persistence.reterive(directory: .document, fileName: fileName) {
            return model
        }
        return nil
    }
    
}
