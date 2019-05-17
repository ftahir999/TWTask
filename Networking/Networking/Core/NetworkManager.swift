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
    private static var envoirnment: Environment!
    private let session = URLSession(configuration: .ephemeral)
    private let reachabilityManager = ReachabilityManager()
    
    public static var shared: NetworkManager {
        guard NetworkManager.envoirnment != nil else {
            fatalError("Configure Network Envoirnment")
        }
        return NetworkManager()
    }
    
    @discardableResult
    public func request<E: EndPointProvider>(request: E, completion: @escaping Completion<E.ResponseDTO>) -> NetworkTask? {
        
        guard let urlRequest = request.endpoint.asURLRequest() else {
            completion(.failure(.invalidRequest))
            return nil
        }
        
        guard reachabilityManager.isReachable else {
            completion(.failure(.notAccessible))
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
    
    public static func setNetworkEnvironment(envoirnment: Environment) {
        self.envoirnment = envoirnment
    }
    
    public static func getNetworkEnvironment() -> Environment {
        return envoirnment
    }
}
    

