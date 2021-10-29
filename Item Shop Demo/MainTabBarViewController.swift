//
//  MainTabBarViewController.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 9/24/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shopTableViewController = ShopTableViewController()
        let uiKitShopNavigationController = UINavigationController(rootViewController: shopTableViewController)
        viewControllers = [uiKitShopNavigationController]
    }

}
