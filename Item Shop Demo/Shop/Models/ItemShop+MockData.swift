//
//  ItemShop+MockData.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/4/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Foundation

extension ItemShop {

    static func fake() -> Self {
        return ItemShop(
            featuredItems: [
                RocketLeagueItem(
                    name: "Vampire Bat",
                    category: "Goal Explosion",
                    paint: "Cobalt",
                    certification: "None",
                    rarity: "Import",
                    price: 700,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/VampireBat.png"
                ),
                RocketLeagueItem(
                    name: "Slipstream",
                    category: "Decal",
                    paint: "Cobalt",
                    certification: "None",
                    rarity: "Black Market",
                    price: 2200,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/Slipstream.png"
                )
            ],
            featuredStartDate: Date(),
            featuredEndDate: .nextShopRefresh,
            dailyItems: [
                RocketLeagueItem(
                    name: "Breakout: Heiwa",
                    category: "Decal",
                    paint: "Sky Blue",
                    certification: "None",
                    rarity: "Rare",
                    price: 100,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/BreakoutHeiwa.png"
                ),
                RocketLeagueItem(
                    name: "Magic Missile",
                    category: "Rocket Boost",
                    paint: "Black",
                    certification: "None",
                    rarity: "Import",
                    price: 600,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/MagicMissile.png"
                ),
                RocketLeagueItem(
                    name: "Yuzo",
                    category: "Wheels",
                    paint: "Orange",
                    certification: "None",
                    rarity: "Very Rare",
                    price: 300,
                    isTradable: true,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/Yuzo-Orange.png"
                ),
                RocketLeagueItem(
                    name: "Masamune",
                    category: "Body",
                    paint: "Forest Green",
                    certification: "None",
                    rarity: "Very Rare",
                    price: 400,
                    isTradable: false,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/Masamune-ForestGreen.png"
                ),
                RocketLeagueItem(
                    name: "Masamune: Trihedron",
                    category: "Decal",
                    paint: "Lime",
                    certification: "None",
                    rarity: "Rare",
                    price: 100,
                    isTradable: false,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/Decal-MasamuneTrihedron-Purple.png"
                ),
                RocketLeagueItem(
                    name: "Masamune: Druk",
                    category: "Decal",
                    paint: "Grey",
                    certification: "None",
                    rarity: "Rare",
                    price: 100,
                    isTradable: false,
                    imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/Decal-MasamuneDruk-Purple.png"
                )
            ],
            dailyStartDate: Date(),
            dailyEndDate: .nextShopRefresh,
            message: "This is a test message. Thanks for looking at my app! :)"
        )
    }

}
