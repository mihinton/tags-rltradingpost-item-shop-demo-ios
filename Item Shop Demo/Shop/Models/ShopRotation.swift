//
//  ShopRotation.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 2/27/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import FirebaseFirestoreSwift
import Foundation

struct ShopRotation: Codable {

    @DocumentID var key: String?
    var featuredItems: [ShopItem] = []
    var featuredStartDate: Date
    var featuredEndDate: Date
    var dailyItems: [ShopItem] = []
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
