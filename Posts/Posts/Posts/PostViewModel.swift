//
//  PostViewModel.swift
//  TWTask
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Network

class PostViewModel {
    let model: Post
    let title: String
    let detail: String
    
    init(model: Post) {
        self.model = model
        title = model.title ?? "Not Available"
        detail = model.body ?? "Not Available"
    }
}
