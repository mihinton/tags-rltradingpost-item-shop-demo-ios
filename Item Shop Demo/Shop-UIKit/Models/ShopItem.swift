//
//  ShopItem.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 2/27/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import Foundation

struct ShopItem: Codable {

    var name: String
    var category: String
    var color: String
    var certification: String
    var rarity: String
    var price: Int
    var isTradable: Bool
    var imageUrl: String? = nil

    enum CodingKeys: String, CodingKey {
        case name
        case category
        case color
        case certification
        case rarity
        case price
        case isTradable = "tradable"
        case imageUrl
    }

}
