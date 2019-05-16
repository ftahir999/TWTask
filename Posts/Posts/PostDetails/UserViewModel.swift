//
//  AuthorViewModel.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 14/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

class UserViewModel {
    let model: User
    let name: String
    let email: String
    
    init(model: User) {
        self.model = model
        name = model.name ?? "Not Available"
        email = model.email ?? "Not Available"
        
    }
}
