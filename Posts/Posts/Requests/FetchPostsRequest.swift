//
//  FetchPostsRequest.swift
//  Network
//
//  Created by Farhan Tahir on 13/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Networking

public class FetchPostsRequest: EndPointProvider {
    public typealias ResponseDTO = Posts
    
    public var endpoint: Endpoint<ResponseDTO> {
        return Endpoint(method: .get,
                        path: "/posts", query: [:], body: nil)
    }
    
    public init() {
        
    }
}
