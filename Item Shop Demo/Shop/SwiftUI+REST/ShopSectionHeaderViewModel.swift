//
//  ShopSectionHeaderViewModel.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/4/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Combine
import Foundation

class ShopSectionHeaderViewModel: ObservableObject {

    private let secPerDay = 86400
    private let secPerHour = 3600
    private let secPerMin = 60

    let title: String
    let endDate: Date

    private var timerCancellable: AnyCancellable? = nil
    @Published var timeRemainingCountdownText: String? = ""

    init(title: String, endDate: Date) {
        self.title = title
        self.endDate = endDate

        timerCancellable = Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
            .map { [weak self] _ in
                self?.getTimeRemaining()
            }
            .assign(to: \ShopSectionHeaderViewModel.timeRemainingCountdownText, on: self)
    }
    
    private func getTimeRemaining() -> String? {
        var seconds = Int(endDate.timeIntervalSince1970.rounded() - Date().timeIntervalSince1970.rounded())
        if seconds <= 0 {
            return nil
        }
        
        if seconds > secPerHour {
            seconds += secPerMin
        }
        
        let days = seconds / secPerDay
        seconds -= (days * secPerDay)
        let hours = seconds / secPerHour
        seconds -= (hours * secPerHour)
        let minutes = seconds / secPerMin
        seconds -= (minutes * secPerMin)
        
        if days > 0 {
            return "\(getDaysText(days: days)) \(getHoursText(hours: hours)) \(getMinutesText(minutes: minutes))"
        } else if hours > 0 {
            return "\(getHoursText(hours: hours)) \(getMinutesText(minutes: minutes))"
        } else if minutes > 0 {
            return "\(getMinutesText(minutes: minutes)) \(getSecondsText(seconds: seconds))"
        } else {
            return getSecondsText(seconds: seconds)
        }
    }
    
    private func getDaysText(days: Int) -> String {
        return "days_remaining_count".localizedPluralable(days)
    }
    
    private func getHoursText(hours: Int) -> String {
        return "hours_remaining_count".localizedPluralable(hours)
    }
    
    private func getMinutesText(minutes: Int) -> String {
        return "minutes_remaining_count".localizedPluralable(minutes)
    }
    
    private func getSecondsText(seconds: Int) -> String {
        return "seconds_remaining_count".localizedPluralable(seconds)
    }
}
