//
//  Dynamic.swift
//  TWTaskSingle
//
//  Created by Farhan Tahir on 15/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = () -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?()
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
