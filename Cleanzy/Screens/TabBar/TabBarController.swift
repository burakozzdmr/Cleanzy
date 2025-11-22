//
//  TabBarController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 22.11.2025.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
}

// MARK: - Privates

private extension TabBarController {
    func setupTabBar() {
        let homepageVC = createNavigationController(
            with: "Anasayfa",
            and: "house.fill",
            from: .init()
        )
        
        self.setViewControllers([homepageVC], animated: false)
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .accent
        self.tabBar.unselectedItemTintColor = .lightGray
    }
    
    func createNavigationController(
        with title: String,
        and imagePath: String,
        from viewController: UIViewController
    ) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = .init(systemName: imagePath)
        
        navigationItem.hidesBackButton = true
        
        return navController
    }
}
