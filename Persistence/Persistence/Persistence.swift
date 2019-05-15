//
//  Persistence.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 15/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public class Persistence {
    public static let shared = Persistence()
    
    public enum Directory {
        case document
        case cache
    }
    
    public func save<T: Codable>(value: T, directory: Directory, fileName: String) {
        let data = try? JSONEncoder().encode(value)
        if let url = getFileURL(directory: directory, fileName: fileName) {
            try? data?.write(to: url, options: .atomic)
        }
        
    }
    
    public func reterive<T: Codable>(directory: Directory, fileName: String) -> T? {
        if let url = getFileURL(directory: directory, fileName: fileName),
            let data = try? Data(contentsOf: url) {
            guard let value = try? JSONDecoder().decode(T.self, from: data) else {
                return nil
            }
            return value
        }
        return nil
    }
    
    public func getFileURL(directory: Directory, fileName: String) -> URL? {
        let filePrefix = "file://"
        var path: FileManager.SearchPathDirectory
        switch directory {
        case .document:
            path = .documentDirectory
        case .cache:
            path = .cachesDirectory
        }
        
        if var url = FileManager.default.urls(for: path, in: .userDomainMask).first {
            url = url.appendingPathComponent(fileName, isDirectory: false)
            if url.absoluteString.lowercased().prefix(filePrefix.count) != filePrefix {
                let fixedUrlString = filePrefix + url.absoluteString
                url = URL(string: fixedUrlString)!
            }
            return url
        }
        return nil
    }
}
