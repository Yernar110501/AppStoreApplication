//
//  BaseTabBarController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 03.05.2024.
//

import UIKit

class BaseTabBarController: UITabBarController {
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavController(viewController: AppsController(), title: "Apps", imageName: "square.3.layers.3d.top.filled"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "magnifyingglass"),
            createNavController(viewController: ViewController(), title: "Today", imageName: "doc.text.image"),
        ]
        
    }
    
    // MARK: - Helpers
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        return navController
    }
}
