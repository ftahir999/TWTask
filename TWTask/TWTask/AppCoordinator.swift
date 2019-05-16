//
//  AppCoordinator.swift
//  TWTask
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Posts
import Common

class AppCoordinator {
    private let appWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    private var router: Router?
    
    func startPostsFlow() {
        router = PostsRouter()
        appWindow.rootViewController = router?.rootViewController
        appWindow.makeKeyAndVisible()
        router?.start()
    }
    
}
