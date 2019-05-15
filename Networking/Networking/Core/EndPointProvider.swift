//
//  EndPointProvider.swift
//  Network
//
//  Created by Farhan Tahir on 13/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public protocol EndPointProvider {
    associatedtype ResponseDTO: Decodable
    var endpoint: Endpoint<ResponseDTO> { get }
}
