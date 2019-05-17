//
//  EnvoirnmentTests.swift
//  NetworkingTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import XCTest
@testable import Networking

class EnvoirnmentTests: XCTestCase {
    var envoirnment: Environment?
    
    override func setUp() {
        envoirnment = Environment(target: .prod, host: "google.com", scheme: "http", commonHeaders: [:])
    }
    
    func testEnvoirnmentHost() {
        XCTAssertTrue(envoirnment?.host == "google.com")
    }
    
    func testEnvoirnmentTarget() {
        XCTAssertTrue(envoirnment?.target == EnvironmentTarget.prod)
    }
    
    func testEnvoirnmentScheme() {
        XCTAssertTrue(envoirnment?.scheme == "http")
    }
    
    func testEnvoirnmentCommonHeaders() {
        XCTAssertTrue(envoirnment?.commonHeaders == [:])
    }
}

