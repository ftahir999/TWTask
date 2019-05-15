//
//  CommentViewModel.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

class CommentViewModel {
    let model: Comment
    let name: String
    let email: String
    let comment: String
    
    init(model: Comment) {
        self.model = model
        name = model.name ?? "Not Available"
        email = model.email ?? "Not Available"
        comment = model.body ?? "Not Available"
    }
}
