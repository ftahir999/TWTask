//
//  DummyEndpoint.swift
//  NetworkingTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

struct DummyRequest: EndPointProvider {
    typealias ResponseDTO = DummyData
    let path: String
    public var endpoint: Endpoint<ResponseDTO> {
        return Endpoint(method: .get,
                        path: path, query: [:], body: nil)
    }
    
    init(path: String) {
        self.path = path
    }

}
