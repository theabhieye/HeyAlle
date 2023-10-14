//
//  UIViewController+Extension.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import UIKit

import UIKit

extension UIViewController {
    func topNavigationController() -> UINavigationController {
        if let navigationController = self.navigationController {
            return navigationController
        } else if let presentedViewController = self.presentedViewController {
            return presentedViewController.topNavigationController()
        } else {
            let newNavController = UINavigationController(rootViewController: self)
            return newNavController
        }
    }
}

