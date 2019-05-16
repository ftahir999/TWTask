//
//  Router.swift
//  Common
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation


public protocol Router {
    var rootViewController: UINavigationController { get }
    func start()
    func dismiss()
}
