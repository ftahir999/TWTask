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
import Networking
import Persistence

class AppCoordinator {
    private let appWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    private var router: Router?
    
    func configure() {
        NetworkManager.setNetworkEnvironment(envoirnment: .getProdEnvironment())
    }
    
    func startPostsFlow() {
        let dataProvider = DataProvider(networkingManager: NetworkManager.shared, persistence: Persistence.shared)
        router = PostsRouter.init(dataProvider: dataProvider)
        appWindow.rootViewController = router?.rootViewController
        appWindow.makeKeyAndVisible()
        router?.start()
    }
    
}
