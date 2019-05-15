//
//  FetchPostCommentRequest.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Networking

public class FetchPostCommentsRequest: EndPointProvider {
    public typealias ResponseDTO = CommentsDTO
    
    public var endpoint: Endpoint<ResponseDTO> {
        let path = "/posts/\(postId)/comments"
        return Endpoint(method: .get,
                        path: path, query: [:], body: nil)
    }
    
    private let postId: Int
    public init(postId: Int) {
      self.postId = postId
    }
}
