//
//  MockNetworkManager.swift
//  NetworkingTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

class MockNetworkManager: NetworkManager {
    var response: DummyData?
    
    @discardableResult
    override func request<E: EndPointProvider>(request: E, completion: @escaping Completion<E.ResponseDTO>) -> NetworkTask? {
        
        guard let _ = request.endpoint.asURLRequest() else {
            completion(.failure(.invalidRequest))
            return nil
        }
        if let response = self.response as? E.ResponseDTO {
            completion(.success(response))
        } else {
            completion(.failure(.invalidData))
        }
        return nil
        
    }
    
}
