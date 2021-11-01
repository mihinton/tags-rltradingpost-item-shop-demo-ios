//
//  MainTabBarViewController.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 9/24/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI
import UIKit

class MainTabBarViewController: UITabBarController {

    private let uiKitTabIndex = 1
    private let swiftUiTabIndex = 0

    private var shopTableViewController: ShopTableViewController!
    private var itemShopView: ItemShopView!

    private var currentIndex = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let newIndex = item.tag
        guard newIndex == currentIndex else {
            currentIndex = item.tag
            return
        }
        
        if newIndex == uiKitTabIndex {
            shopTableViewController.scrollToTop()
        }
    }
    
    private func setupViewControllers() {
        shopTableViewController = ShopTableViewController()
        shopTableViewController.title = "UIKit/Firebase".localized
        let uiKitShopNavigationController = UINavigationController(rootViewController: shopTableViewController)
        uiKitShopNavigationController.tabBarItem = UITabBarItem(title: "UIKit".localized, image: nil, tag: uiKitTabIndex)
        
        itemShopView = ItemShopView()
        let shopHostingController = UIHostingController(rootView: itemShopView)
        shopHostingController.tabBarItem = UITabBarItem(title: "SwiftUI".localized, image: nil, tag: swiftUiTabIndex)
        viewControllers = [shopHostingController, uiKitShopNavigationController]
    }

}
