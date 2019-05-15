//
//  NetworkManager.swift
//  Network
//
//  Created by Farhan Tahir on 13/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public enum Response<Class> {
    case success(Class?)
    case failure(Error?)
}

public typealias Completion<Class: Decodable> = (Response<Class>) -> Void

public class NetworkManager {
    public static let shared = NetworkManager()
    
    private let session = URLSession.init(configuration: .default)
    public var envoirnment: Environment = Environment.getProdEnvironment()
    
    @discardableResult
    public func request<E: EndPointProvider>(request: E, completion: @escaping Completion<E.ResponseDTO>) -> NetworkTask? {
        
        let urlRequest = request.endpoint.asURLRequest()
        let networkTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                completion(.failure(nil))
                return
            }
            let decoder = JSONDecoder()
            let object = try? decoder.decode(E.ResponseDTO.self, from: data)
            DispatchQueue.main.async {
                completion(.success(object ?? nil))
            }
        }
        networkTask.resume()
        return networkTask
    }
    
        
}
    

