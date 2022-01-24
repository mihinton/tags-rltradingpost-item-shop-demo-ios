//
//  Color+Hex.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 11/1/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

extension Color {

    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var opacity: Double = 1.0
        var red: Double = 0.0
        var green: Double = 0.0
        var blue: Double = 0.0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            self.init(.sRGB, red: 0, green: 0, blue: 0, opacity: 1.0)
            return
        }
        
        let length = hexSanitized.count
        if length == 6 {
            red = Double((rgb & 0xFF0000) >> 16) / 255.0
            green = Double((rgb & 0x00FF00) >> 8) / 255.0
            blue = Double(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            opacity = Double((rgb & 0xFF000000) >> 24) / 255.0
            red = Double((rgb & 0x00FF0000) >> 16) / 255.0
            green = Double((rgb & 0x0000FF00) >> 8) / 255.0
            blue = Double(rgb & 0x000000FF) / 255.0
        } else {
            self.init(.sRGB, red: 0, green: 0, blue: 0, opacity: 1.0)
            return
        }
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }

}
