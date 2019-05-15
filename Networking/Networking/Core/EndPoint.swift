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

extension Endpoint {
    private func url() -> URL {
        var componets = URLComponents()
        componets.scheme = NetworkManager.shared.envoirnment.scheme
        componets.host = NetworkManager.shared.envoirnment.host
        componets.path = path
        
        if !NetworkManager.shared.envoirnment.commonHeaders.isEmpty {
            componets.queryItems = NetworkManager.shared.envoirnment.commonHeaders.map { URLQueryItem(name: $0, value: $1) }
        }
        
        if !query.isEmpty {
            componets.queryItems = query.map { URLQueryItem(name: $0, value: $1) }
        }
        return componets.url!
        
    }
    
    public func asURLRequest() -> URLRequest {
        var request = URLRequest(url: url())
        request.httpMethod = method.rawValue.uppercased()
        
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        return request
    }
}
