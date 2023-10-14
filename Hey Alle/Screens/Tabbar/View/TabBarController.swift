//
//  TabBarController.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import UIKit

final class TabBarController: UITabBarController {
    
    let viewModel: TabBarViewModel
    
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBinding()
        setupTabbar()
    }
    
    private func setupTabbar() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = .white
        delegate = self
    }
    
    private func setupViewBinding() {
        viewModel.tabbarController = self
        viewModel.loadTabbar()
        viewModel.updateSelectedIndex(selectedIndex)
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        viewModel.updateSelectedIndex(selectedIndex)
    }
}
