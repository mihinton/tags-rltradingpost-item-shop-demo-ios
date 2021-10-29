//
//  ColorUtils.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 10/29/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import UIKit

class ColorUtils {

    static func getPaintedColor(_ color: String) -> UIColor {
        switch color {
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
    
    static func getRarityColor(_ rarity: String) -> UIColor {
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
