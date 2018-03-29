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
        } else {
            self.text = "00:00"
        }
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
