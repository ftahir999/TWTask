//
//  Endpoint+Ext.swift
//  Networking
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

extension Endpoint {
    private func url() -> URL? {
        let envoirnment = NetworkManager.getNetworkEnvironment()
        var componets = URLComponents()
        componets.scheme = envoirnment.scheme
        componets.host = envoirnment.host
        componets.path = path
        
        if !envoirnment.commonHeaders.isEmpty {
            componets.queryItems = envoirnment.commonHeaders.map { URLQueryItem(name: $0, value: $1) }
        }
        
        if !query.isEmpty {
            componets.queryItems = query.map { URLQueryItem(name: $0, value: $1) }
        }
        return componets.url
    }
    
    public func asURLRequest() -> URLRequest? {
        guard let url = url() else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        return request
    }
}
