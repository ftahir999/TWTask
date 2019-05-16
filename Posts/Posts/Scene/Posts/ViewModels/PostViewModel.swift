//
//  PostViewModel.swift
//  TWTask
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation
import Network

struct PostViewModel {
    let model: Post
    var title: String {
        return model.title ?? "Not Available"
    }
    var detail: String {
        return model.body ?? "Not Available"
    }
    
    init(model: Post) {
        self.model = model
    }
}
