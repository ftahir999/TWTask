//
//  Persistence.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 15/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public class Persistence {
    
    // Public
    public static let shared = Persistence()
    public enum Directory {
        case document
        case cache
    }
    
    @discardableResult
    public func save<T: Encodable>(value: T, directory: Directory, fileName: String) -> Bool {
        let data = try? JSONEncoder().encode(value)
        guard let url = getFileURL(directory: directory, fileName: fileName) else {
            return false
        }
        
        do {
            try data?.write(to: url, options: .atomic)
        }
        catch {
            return false
        }
        return true
    }
    
    public func reterive<T: Decodable>(directory: Directory, fileName: String) -> T? {
        if let url = getFileURL(directory: directory, fileName: fileName),
            let data = try? Data(contentsOf: url) {
            guard let value = try? JSONDecoder().decode(T.self, from: data) else {
                return nil
            }
            return value
        }
        return nil
    }
    
    // internal: For testing
    func getFileURL(directory: Directory, fileName: String) -> URL? {
        var path: FileManager.SearchPathDirectory
        switch directory {
        case .document:
            path = .documentDirectory
        case .cache:
            path = .cachesDirectory
        }
        
        if var url = FileManager.default.urls(for: path, in: .userDomainMask).first {
            url = url.appendingPathComponent(fileName, isDirectory: false)
            return url
        }
        return nil
    }
}
