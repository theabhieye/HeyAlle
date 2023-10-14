//
//  TabbarRouterRouter.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import UIKit

protocol TabbarRouterRouter: DefaultRouter {
    var getTabbarItems: [TabbarItem] { get }
    func loadTabbarController() -> UITabBarController
}

final class TabbarRouterImpl: TabbarRouterRouter {

    let defaultRouter: DefaultRouter
    
    var getTabbarItems: [TabbarItem] {
        [getShareItem,getInfoItem,getDeleteItem]
    }
    
    private var getShareItem: TabbarItem {
        
        let viewController = defaultRouter.getShareViewController()
        viewController.view.backgroundColor = .white
        let selectedBackgroundColor = UIColor.black
        let unselectedBackgroundColor = UIColor.gray

        let selectedImage = UIImage(systemName: "square.and.arrow.up")?
            .withTintColor(selectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        let unselectedImage = UIImage(systemName: "square.and.arrow.up.fill")?
            .withTintColor(unselectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        return TabbarItem(viewController: viewController,
                  selectedImage: selectedImage,
                  unselectedImage: unselectedImage,
                  title: .share)
    }
 
    private var getInfoItem: TabbarItem {
        
        let viewController = defaultRouter.getInfoViewController()
        
        let selectedBackgroundColor = UIColor.black
        let unselectedBackgroundColor = UIColor.gray

        let selectedImage = UIImage(systemName: "info.circle")?
            .withTintColor(selectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        let unselectedImage = UIImage(systemName: "info.circle.fill")?
            .withTintColor(unselectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        return TabbarItem(viewController: viewController,
                  selectedImage: selectedImage,
                  unselectedImage: unselectedImage,
                  title: .info)
    }
 
    private  var getDeleteItem: TabbarItem {
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        let selectedBackgroundColor = UIColor.black
        let unselectedBackgroundColor = UIColor.gray

        let selectedImage = UIImage(systemName: "trash.fill")?
            .withTintColor(selectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        let unselectedImage = UIImage(systemName: "trash")?
            .withTintColor(unselectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        return TabbarItem(viewController: viewController,
                  selectedImage: selectedImage,
                  unselectedImage: unselectedImage,
                  title: .delete)
    }
    
    
    init(defaultRouter: DefaultRouter = DefaultRouterImpl()){
        self.defaultRouter = defaultRouter
    }
    
    func loadTabbarController() -> UITabBarController {
        let tabbarItem = getTabbarItems
        let viewModel = TabBarViewModelImpl(tabbarItems: tabbarItem)
        let tabbarController = TabBarController(viewModel: viewModel)
        viewModel.tabbarController = tabbarController
        return tabbarController
    }
}
