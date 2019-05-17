//
//  UserInfoRequest.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Networking

public class UserInfoRequest: EndPointProvider {
    
    private let userId: Int    
    public typealias ResponseDTO = User
    
    public var endpoint: Endpoint<ResponseDTO> {
        let path = RequestPath.userInfo(userId: userId).path()
        return Endpoint(method: .get,
                        path: path, query: [:], body: nil)
    }
    
    public init(userId: Int) {
        self.userId = userId
    }
}
