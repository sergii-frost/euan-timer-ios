//
//  UITimeLabel.swift
//  EuanTimer
//
//  Created by Sergii Frost on 2018-03-23.
//  Copyright © 2018 Frost°. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class EUTimeLabel: UILabel {
    
    var maxInterval: TimeInterval?
    fileprivate var startDate: Date?
    
    var timer: Timer?
    
    func start() {
        timer?.invalidate()
        startDate = Date()
        updateUI()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.updateUI()
        })
    }
    
    func isStarted() -> Bool {
        if let _ = startDate {
            return true
        }
        return false
    }
    
    func stop() {
        
    }
    
    fileprivate func updateUI() {
        if let startDate = self.startDate {
            let counter = Date().timeIntervalSince(startDate)
            self.text = counter.format(using: [.minute, .second])
            updateColor(forInterval: counter)
        } else {
            updateColor(forInterval: 0)
            self.text = "00:00"
        }
    }
    
    fileprivate func updateColor(forInterval interval: TimeInterval) {
        guard let maxInterval = maxInterval else {
            self.textColor = UIColor.euGreenColor()
            return
        }
        self.textColor = Int(interval) > Int(maxInterval) ? UIColor.euRedColor() : UIColor.euGreenColor()
    }
}

extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: self)
    }
}
