//
//  UIViewController+Instantiable.swift
//  Common
//
//  Created by Farhan Tahir on 16/05/2019.
//  Copyright © 2019 Farhan Tahir. All rights reserved.
//

import Foundation

public protocol Instantiatable: class {
    
    static func instantiate() -> Self
}

public extension Instantiatable where Self: UIViewController {
    
    static func instantiate() -> Self {
        return create(type: self,
                      from: UIStoryboard(name: storyboardName, bundle: bundle),
                      with: identifier)
    }
    
    // MARK: - Private
    
    private static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    private static var identifier: String {
        return String(describing: self)
    }
    
    private static var storyboardName: String {
        return String(describing: self)
    }
    
    private static func create<T>(type: T.Type, from storyboard: UIStoryboard, with identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
