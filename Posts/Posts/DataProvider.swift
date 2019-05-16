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

public typealias AllPostsHandler = (Posts?) -> ()
public typealias PostCommentsHandler = (Comments?) -> ()
public typealias UserInfoHandler = (User?) -> ()

public class DataProvider {
    
    func fetchPosts(handler: @escaping AllPostsHandler) {
        let fileName = "Posts.json"
        let request = FetchPostsRequest()
        NetworkManager.shared.request(request: request) { (response) in
            switch response {
            case .success(let dto):
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
        let fileName = "Comments_\(postId).json"
        let request = FetchPostCommentsRequest(postId: postId)
        NetworkManager.shared.request(request: request) { (response) in
            switch response {
            case .success(let dto):
                
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
        let fileName = "User_\(userId).json"
        let request = UserInfoRequest(userId: userId)
        NetworkManager.shared.request(request: request) { (response) in
            switch response {
            case .success(let dto):
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
    
    func saveModel<T: Codable>(model: T, fileName: String) {
        Persistence.shared.save(value: model, directory: .document, fileName: fileName)
    }
    
    func loadSaveData<T: Codable>(fileName: String) -> T? {
        if let model: T = Persistence.shared.reterive(directory: .document, fileName: fileName) {
            return model
        }
        return nil
    }
    
    public init() {}
    
}
