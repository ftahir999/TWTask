//
//  PersistenceTests.swift
//  PersistenceTests
//
//  Created by Farhan Tahir on 15/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import XCTest
@testable import Persistence

struct DummyData: Codable {
    let data: String
}

class PersistenceTests: XCTestCase {

    func testDataSaved() {
        let persistence = MockPersistence()
        let url = persistence.getFileURL(directory: .document, fileName: "dummy.json")!
        
        persistence.save(value: DummyData(data: "data"), directory: .document, fileName: "dummy.json")
        let dto: DummyData? = persistence.reterive(directory: Persistence.Directory.document, fileName: "dummy.json")
        XCTAssertNotNil(dto)
        XCTAssert(dto?.data == "data")
        
        addTeardownBlock {
            do {
                let fileManager = FileManager.default
                // Check that the file exists before trying to delete it.
                if fileManager.fileExists(atPath: url.path) {
                    // Perform the deletion.
                    try fileManager.removeItem(at: url)
                    // Verify that the file no longer exists after the deletion.
                    XCTAssertFalse(fileManager.fileExists(atPath: url.path))
                }
            } catch {
                // Treat any errors during file deletion as a test failure.
                XCTFail("Error while deleting temporary file: \(error)")
            }
        }
    }

}
