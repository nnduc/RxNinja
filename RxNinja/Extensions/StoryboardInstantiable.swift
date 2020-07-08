//
//  StoryboardInstantiable.swift
//  RxNinja
//
//  Created by Duc Nguyen on 7/8/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable: UIViewController { }

extension StoryboardInstantiable {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: className, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }

    static func instantiateWithNavigationController() -> UINavigationController {
        let storyboard = UIStoryboard(name: className, bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
}

extension NSObject {
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    var className: String {
        return type(of: self).className
    }
}

