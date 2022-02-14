//
//  RocketLeagueItem+MockData.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/4/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Foundation

extension RocketLeagueItem {

    static func fake() -> Self {
        return RocketLeagueItem(
            name: "Vampire Bat",
            category: "Goal Explosion",
            paint: "Cobalt",
            certification: "None",
            rarity: "Import",
            price: 700,
            isTradable: true,
            iconUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/VampireBat.png"
        )
    }

}
