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
        Persistence.shared.save(value: DummyData(data: "data"), directory: .document, fileName: "dummy.json")
        let dto: DummyData? = Persistence.shared.reterive(directory: Persistence.Directory.document, fileName: "dummy.json")
        XCTAssertNotNil(dto)
        XCTAssert(dto?.data == "data")
    }

}
