//
//  NetworkTask.swift
//  Network
//
//  Created by Farhan Tahir on 13/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public protocol NetworkTask {
    func startTask()
    func pauseTask()
    func cancelTask()
}

extension URLSessionDataTask : NetworkTask {
    public func startTask() {
        self.resume()
    }
    
    public func pauseTask() {
        self.suspend()
    }
    
    public func cancelTask() {
        self.cancel()
    }
}
