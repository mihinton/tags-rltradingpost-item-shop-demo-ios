//
//  Item_Shop_DemoApp.swift
//  Watch Item Shop Demo WatchKit Extension
//
//  Created by Michael Hinton on 2/15/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import SwiftUI

@main
struct Item_Shop_DemoApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
