//
//  ShopRotation+MockData.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/4/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Foundation

extension ShopRotation {

    static func fake() -> Self {
        return ShopRotation(
            featuredItems: [
                ShopItem(
                    name: "Vampire Bat",
                    category: "Goal Explosion",
                    color: "Cobalt",
                    certification: "None",
                    rarity: "Import",
                    price: 700,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/VampireBat.png"
                ),
                ShopItem(
                    name: "Slipstream",
                    category: "Decal",
                    color: "Cobalt",
                    certification: "None",
                    rarity: "Black Market",
                    price: 2200,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/Slipstream.png"
                )
            ],
            featuredStartDate: Date(),
            featuredEndDate: Date(),
            dailyItems: [
                ShopItem(
                    name: "Breakout: Heiwa",
                    category: "Decal",
                    color: "Sky Blue",
                    certification: "None",
                    rarity: "Rare",
                    price: 100,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/BreakoutHeiwa.png"
                ),
                ShopItem(
                    name: "Magic Missile",
                    category: "Rocket Boost",
                    color: "Black",
                    certification: "None",
                    rarity: "Import",
                    price: 600,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/MagicMissile.png"
                ),
                ShopItem(
                    name: "Yuzo",
                    category: "Wheels",
                    color: "Orange",
                    certification: "None",
                    rarity: "Very Rare",
                    price: 300,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/Yuzo-Orange.png"
                ),
                ShopItem(
                    name: "Masamune",
                    category: "Body",
                    color: "Forest Green",
                    certification: "None",
                    rarity: "Very Rare",
                    price: 400,
                    isTradable: false,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/Masamune-ForestGreen.png"
                ),
                ShopItem(
                    name: "Masamune: Trihedron",
                    category: "Decal",
                    color: "Lime",
                    certification: "None",
                    rarity: "Rare",
                    price: 100,
                    isTradable: false,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/Decal-MasamuneTrihedron-Purple.png"
                ),
                ShopItem(
                    name: "Masamune: Druk",
                    category: "Decal",
                    color: "Grey",
                    certification: "None",
                    rarity: "Rare",
                    price: 100,
                    isTradable: false,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/Decal-MasamuneDruk-Purple.png"
                )
            ],
            dailyStartDate: Date(),
            dailyEndDate: Date(),
            message: "This is a test message. Thanks for looking at my app! :)"
        )
    }

}
