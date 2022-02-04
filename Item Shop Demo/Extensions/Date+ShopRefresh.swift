//
//  Date+ShopRefresh.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/4/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Foundation

extension Date {

    private static let utcShopRefreshHour = 20 // 20:00

    static var nextShopRefresh: Self {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        
        var refreshHour = utcShopRefreshHour
        if TimeZone(identifier: "America/New_York")!.isDaylightSavingTime() {
            refreshHour -= 1
        }
        
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        let isRefreshToday = dateComponents.hour! < refreshHour
        dateComponents.hour = refreshHour
        dateComponents.minute = 0
        dateComponents.second = 1
        
        guard let dateFromComponents = calendar.date(from: dateComponents) else { return Date() }
        
        if isRefreshToday {
            return dateFromComponents
        }
        
        return calendar.date(byAdding: .day, value: 1, to: dateFromComponents) ?? Date()
    }

}
