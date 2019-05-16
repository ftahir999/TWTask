//
//  XCTestCase+Ext.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import XCTest

extension XCTestCase {
    // TODO: migrate all tests to this function, remove the other one
    static func loadJsonData() -> Data {
        // swiftlint:disable force_try
        let className = NSStringFromClass(self).components(separatedBy: ".").last!
        let fileUrl = Bundle(for: CommentTests.self).url(forResource: className, withExtension: "json")!
        return try! Data(contentsOf: fileUrl)
    }
    
    static func loadJson() -> [String: Any] {
        // swiftlint:disable force_try
        return (try! JSONSerialization.jsonObject(with: loadJsonData())) as! [String: Any]
    }
}
