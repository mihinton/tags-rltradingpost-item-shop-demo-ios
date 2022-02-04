//
//  ShopItem+MockData.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/4/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Foundation

extension ShopItem {

    static func fake() -> Self {
        return ShopItem(
            name: "Vampire Bat",
            category: "Goal Explosion",
            color: "Cobalt",
            certification: "None",
            rarity: "Import",
            price: 700,
            isTradable: true,
            imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/VampireBat.png"
        )
    }

}
