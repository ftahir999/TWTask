//
//  AuthorViewModel.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

struct UserViewModel {
    let model: User
    var name: String {
        return model.name ?? "Not Available"
    }
    var email: String {
        return model.email ?? "Not Available"
    }
    
    init(model: User) {
        self.model = model
    }
}
