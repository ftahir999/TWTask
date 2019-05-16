//
//  UserTests.swift
//  PostsTests
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import XCTest
@testable import Posts

class UserTests: XCTestCase {

    func testUserDTO() {
        let user = try? JSONDecoder().decode(User.self, from: UserTests.loadJsonData())        
        XCTAssertTrue(user?.id == 1)
        XCTAssertTrue(user?.name == "Leanne Graham")
        XCTAssertTrue(user?.email == "Sincere@april.biz")
        XCTAssertTrue(user?.phone == "1-770-736-8031 x56442")
    }

}
