//
//  Environment.swift
//  Networking
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public enum EnvironmentTarget {
    case qa
    case prod
    
    func hostURL() -> String {
        switch self {
        case .qa:
            return "jsonplaceholder.typicode.com"
        case .prod:
            return "jsonplaceholder.typicode.com"
        
        }
    }
    
    func scheme() -> String {
        switch self {
        case .qa:
            return "https"
        case .prod:
            return "https"
            
        }
    }
    
    func commonHeaders() -> [String: String] {
        let headers =  [
            "Content-Type": "application/json"
        ]
        return headers
    }
    
}

public struct Environment {
    let target: EnvironmentTarget
    let host: String
    let scheme: String
    let commonHeaders: [String: String]
    
    public init(target: EnvironmentTarget, host: String, scheme: String, commonHeaders: [String: String]) {
        self.target = target
        self.host = host
        self.scheme = scheme
        self.commonHeaders = commonHeaders
    }
}

public extension Environment {
    static func getProdEnvironment() -> Environment {
        let target: EnvironmentTarget = .prod
        return Environment.init(target: target, host: target.hostURL(), scheme: target.scheme(), commonHeaders: target.commonHeaders())
    }
}
