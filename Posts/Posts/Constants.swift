//
//  Constants.swift
//  Posts
//
//  Created by Farhan Tahir on 17/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

enum RequestPath {
    case posts
    case postComments(postId: Int)
    case userInfo(userId: Int)
    
    func path() -> String {
        switch self {
        case .posts:
            return "/posts"
        case .postComments(let postId):
            return String(format: "/posts/%d/comments", postId)
        case .userInfo(let userId):
            return String(format: "/users/%d", userId)
        }
    }
}

enum FilePath {
    case posts
    case postComments(postId: Int)
    case userInfo(userId: Int)
    
    func path() -> String {
        switch self {
        case .posts:
            return "Posts.json"
        case .postComments(let postId):
            return String(format: "Comments_%d.json", postId)
        case .userInfo(let userId):
            return String(format: "User_%d.json", userId)
        }
    }
}
