//
//  ItemShop.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/27/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import Foundation

struct ItemShop: Codable {

    var featuredItems: [RocketLeagueItem] = []
    var featuredStartDate: Date
    var featuredEndDate: Date
    var dailyItems: [RocketLeagueItem] = []
    var dailyStartDate: Date
    var dailyEndDate: Date
    var message: String?

    enum CodingKeys: String, CodingKey {
        case featuredItems
        case featuredStartDate = "featuredStartTimestamp"
        case featuredEndDate = "featuredEndTimestamp"
        case dailyItems
        case dailyStartDate = "dailyStartTimestamp"
        case dailyEndDate = "dailyEndTimestamp"
        case message
    }

}
