//
//  EndPoint.swift
//  Network
//
//  Created by Farhan Tahir on 13/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public enum HttpMethod: String {
    case get
    case post
    case put
    case delete
}

public struct Endpoint <D: Decodable>{
    public typealias ResponseDTO = D
    public let method: HttpMethod
    public let path: String
    public let query: [String: String]
    public let body: [String: Any]?
    
    public init(method: HttpMethod, path: String, query: [String: String], body: [String: Any]?) {
        self.method = method
        self.path = path
        self.query = query
        self.body = body
    }
}
