//
//  PostDTO.swift
//  Network
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public typealias PostsDTO = [PostDTO]
public class PostDTO: Codable {
    public let userId: Int?
    public let id: Int?
    public let title: String?
    public let body: String?
}
