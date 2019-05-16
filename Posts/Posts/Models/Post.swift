//
//  PostDTO.swift
//  Network
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public typealias Posts = [Post]
public struct Post: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
