//
//  Comment.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public typealias CommentsDTO = [Comment]
public class Comment: Decodable {
    public let id: Int?
    public let postId: Int?
    public let name: String?
    public let email: String?
    public let body: String?
}
