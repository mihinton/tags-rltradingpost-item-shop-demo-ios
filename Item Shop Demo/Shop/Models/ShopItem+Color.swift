//
//  ShopItem+Color.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/7/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import UIKit

extension ShopItem {

    var paintUiColor: UIColor {
        switch paint {
        case "Black":
            return .blackPainted
        case "Burnt Sienna":
            return .burntSiennaPainted
        case "Cobalt":
            return .cobaltPainted
        case "Crimson":
            return .crimsonPainted
        case "Forest Green":
            return .forestGreenPainted
        case "Grey":
            return .greyPainted
        case "Lime":
            return .limePainted
        case "Orange":
            return .orangePainted
        case "Pink":
            return .pinkPainted
        case "Purple":
            return .purplePainted
        case "Saffron":
            return .saffronPainted
        case "Sky Blue":
            return .skyBluePainted
        case "Titanium White":
            return .titaniumWhitePainted
        default:
            return .black
        }
    }

    var isPaintLight: Bool {
        if paint == "None" { return false }
        let lightColors = ["Lime", "Orange", "Saffron", "Titanium White"]
        return lightColors.contains(paint)
    }

    var rarityUiColor: UIColor {
        switch rarity {
        case "Common":
            return .commonRarity
        case "Uncommon":
            return .uncommonRarity
        case "Rare":
            return .rareRarity
        case "Very Rare":
            return .veryRareRarity
        case "Import":
            return .importRarity
        case "Exotic":
            return .exoticRarity
        case "Black Market":
            return .blackMarketRarity
        case "Limited":
            return .limitedRarity
        case "Premium":
            return .premiumRarity
        default:
            return .black
        }
    }

}
