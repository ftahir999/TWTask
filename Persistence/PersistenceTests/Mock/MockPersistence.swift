//
//  MockPersistence.swift
//  PersistenceTests
//
//  Created by Farhan Tahir on 17/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//


import XCTest
@testable import Persistence

class MockPersistence: Persistence {    
    override func getFileURL(directory: Persistence.Directory, fileName: String) -> URL? {
        // Create a URL for an unique file in the system's temporary directory.
        let directory = NSTemporaryDirectory()
        let fileURL = URL(fileURLWithPath: directory).appendingPathComponent(fileName)
        // Return the temporary file URL for use in a test method.
        return fileURL
    }
}
