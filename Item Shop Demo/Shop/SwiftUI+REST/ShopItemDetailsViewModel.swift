//
//  ShopItemDetailsViewModel.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/13/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Foundation

final class ShopItemDetailsViewModel {

    let item: RocketLeagueItem

    var title: String {
        return !item.isPainted ? item.name : "color_and_item_name".localized(item.paint, item.name)
    }

    init(item: RocketLeagueItem) {
        self.item = item
    }

}
