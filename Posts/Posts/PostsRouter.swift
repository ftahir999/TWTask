//
//  PostsRouter.swift
//  TWTask
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import UIKit
import Common

public class PostsRouter: Router {
    
    // Private
    let dataProvider: DataProvider
    
    // Public
    public var rootViewController = UINavigationController()
    
    public init(dataProvider: DataProvider = DataProvider()) {
        self.dataProvider = dataProvider
    }
    
    public func start() {
        let controller = PostsViewController.instantiate()
        rootViewController.setViewControllers([controller], animated: true)
    }
    
    public func dismiss() {
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
