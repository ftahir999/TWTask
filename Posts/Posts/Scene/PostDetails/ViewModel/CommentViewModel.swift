//
//  CommentViewModel.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

struct CommentViewModel {
    let model: Comment
    var name: String {
        return model.name ?? "Not Available"
    }
    var email: String {
        return model.email ?? "Not Available"
    }
    var comment: String {
        return model.body ?? "Not Available"
    }
    
    init(model: Comment) {
        self.model = model
    }
}
