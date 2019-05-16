//
//  NetworkManager.swift
//  Network
//
//  Created by Farhan Tahir on 13/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public enum NetworkError: Error, Equatable {
    case invalidRequest
    case invalidData
    case notAccessible
}

public enum Response<Class> {
    case success(Class?)
    case failure(NetworkError?)
}

public typealias Completion<Class: Decodable> = (Response<Class>) -> Void

public class NetworkManager {
    public static let shared = NetworkManager()
    
    private let session = URLSession.init(configuration: .ephemeral)
    public var envoirnment: Environment = Environment.getProdEnvironment()
    
    @discardableResult
    public func request<E: EndPointProvider>(request: E, completion: @escaping Completion<E.ResponseDTO>) -> NetworkTask? {
        
        guard let urlRequest = request.endpoint.asURLRequest() else {
            completion(.failure(.invalidRequest))
            return nil
        }
        
        let networkTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.notAccessible))
                return
            }
            
            let decoder = JSONDecoder()
            guard let object = try? decoder.decode(E.ResponseDTO.self, from: data) else {
                completion(.failure(.invalidData))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(object))
            }
        }
        networkTask.resume()
        return networkTask
    }
    
        
}
    

