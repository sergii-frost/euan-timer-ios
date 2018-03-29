//
//  ViewController.swift
//  EuanTimer
//
//  Created by Sergii Frost on 2018-03-18.
//  Copyright © 2018 Frost°. All rights reserved.
//

import UIKit

fileprivate enum EUInterval {
    case oneAndHalfMinute
    case twoMinutes
    case threeMinutes
    
    var interval: TimeInterval {
        switch self {
        case .oneAndHalfMinute:
            return TimeInterval(90)
        case .twoMinutes:
            return TimeInterval(120)
        case .threeMinutes:
            return TimeInterval(180)
        }
    }
    
    static func lookup(byIndex index: Int) -> EUInterval? {
        switch index {
        case 0:
            return EUInterval.oneAndHalfMinute
        case 1:
            return EUInterval.twoMinutes
        case 2:
            return EUInterval.threeMinutes
        default:
            return nil
        }
    }
}

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
        
    @IBOutlet weak var timeLabel: EUTimeLabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var setCountLabel: UILabel!
    @IBOutlet weak var intervalSegmentedControl: UISegmentedControl!
    
    fileprivate var setCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUIForSegmentedControl()
        handleIntervalUpdate()
    }
    
    @IBAction func startTimer() {
        timeLabel.start()
        setCount += 1
        updateSetCountUI()
    }
    
    @IBAction func reset() {
        timeLabel.reset()
        setCount = 0
        updateSetCountUI()
    }
    
    @IBAction func intervalSelected() {
        handleIntervalUpdate(shouldStartTimer: true)
    }
    
    fileprivate func handleIntervalUpdate(shouldStartTimer: Bool = false) {
        let selectedIntervalIndex = intervalSegmentedControl.selectedSegmentIndex
        timeLabel.maxInterval = EUInterval.lookup(byIndex: selectedIntervalIndex)?.interval
        reset()
        if shouldStartTimer {
            startTimer()
        }
    }
    
    fileprivate func updateSetCountUI() {
        setCountLabel.text = "\(setCount)"
    }
    
    fileprivate func setupUIForSegmentedControl() {
        let font = UIFont.systemFont(ofSize: 20)
        intervalSegmentedControl.setTitleTextAttributes([NSAttributedStringKey.font: font], for: .normal)
    }
}

