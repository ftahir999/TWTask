//
//  Comment.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public typealias Comments = [Comment]
public struct Comment: Codable {
    let id: Int?
    let postId: Int?
    let name: String?
    let email: String?
    let body: String?
}
