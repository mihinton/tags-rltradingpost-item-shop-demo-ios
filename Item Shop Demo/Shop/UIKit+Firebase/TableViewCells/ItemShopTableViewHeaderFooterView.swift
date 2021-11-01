//
//  ItemShopTableViewHeaderFooterView.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 2/27/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import UIKit

class ItemShopTableViewHeaderFooterView: UITableViewHeaderFooterView {

    private let secPerDay = 86400
    private let secPerHour = 3600
    private let secPerMin = 60

    @IBOutlet weak var headerLabel: UILabel!

    @IBOutlet weak var timeRemainingContainerView: UIView!
    @IBOutlet weak var remainingTimeLabel: UILabel!

    private var timer: Timer?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timer?.invalidate()
        timer = nil
    }
    
    func setExpiration(date: Date) {
        setTimeRemaining(expirationDate: date)
        
        let timerFireTime = TimeInterval(Int(Date().timeIntervalSince1970) + 1)
        timer = Timer(fire: Date(timeIntervalSince1970: timerFireTime),
                      interval: 1,
                      repeats: true) { _ in
            self.setTimeRemaining(expirationDate: date)
        }
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    private func setTimeRemaining(expirationDate: Date) {
        var seconds = Int(expirationDate.timeIntervalSince1970.rounded() - Date().timeIntervalSince1970.rounded())
        timeRemainingContainerView.isHidden = seconds <= 0
        if seconds <= 0 {
            remainingTimeLabel.text = " "
            return
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
            remainingTimeLabel.text = "\(getDaysText(days: days)) \(getHoursText(hours: hours)) \(getMinutesText(minutes: minutes))"
        } else if hours > 0 {
            remainingTimeLabel.text = "\(getHoursText(hours: hours)) \(getMinutesText(minutes: minutes))"
        } else if minutes > 0 {
            remainingTimeLabel.text = "\(getMinutesText(minutes: minutes)) \(getSecondsText(seconds: seconds))"
        } else {
            remainingTimeLabel.text = getSecondsText(seconds: seconds)
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
