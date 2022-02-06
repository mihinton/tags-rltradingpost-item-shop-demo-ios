//
//  ShopItemViewModel.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/4/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Foundation
import UIKit

final class ShopItemViewModel {

    let item: ShopItem
    let isFeatured: Bool

    var categoryImageFileName: String {
        return item.category.lowercased().replacingOccurrences(of: " ", with: "-")
    }

    init(item: ShopItem, isFeatured: Bool = false) {
        self.item = item
        self.isFeatured = isFeatured
    }
}
