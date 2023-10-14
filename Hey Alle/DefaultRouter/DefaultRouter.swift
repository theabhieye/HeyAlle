//
//  DefaultRouter.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import UIKit

protocol DefaultRouter: AnyObject{
    func getShareViewController() -> UIViewController
    func getInfoViewController() -> UIViewController
    
}

final class DefaultRouterImpl: DefaultRouter {}

extension DefaultRouter {
    func getShareViewController() -> UIViewController {
        let viewModel = ShareViewViewModel()
        let view = ShareView(viewModel: viewModel)
        let viewController = ShareViewController(rootView: view)
        return viewController
    }
    func getInfoViewController() -> UIViewController {
        let viewModel = InfoViewModel()
        let view = InfoView(viewModel: viewModel)
        let viewController = InfoViewController(rootView: view)
        return viewController
    }
}

