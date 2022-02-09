//
//  RocketLeagueItem.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/27/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import Foundation

struct RocketLeagueItem: Codable, Identifiable {

    var id = UUID()
    var name: String
    var category: String
    var paint: String
    var certification: String
    var rarity: String
    var price: Int
    var isTradable: Bool
    var imageUrl: String

    enum CodingKeys: String, CodingKey {
        case name
        case category
        case paint = "color"
        case certification
        case rarity
        case price
        case isTradable = "tradable"
        case imageUrl
    }

}

extension RocketLeagueItem {
    var isPainted: Bool {
        return paint != "None"
    }
    
    var isCertified: Bool {
        return certification != "None"
    }
}
