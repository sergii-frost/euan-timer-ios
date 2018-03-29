//
//  ViewController.swift
//  EuanTimer
//
//  Created by Sergii Frost on 2018-03-18.
//  Copyright © 2018 Frost°. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
        
    @IBOutlet weak var timeLabel: EUTimeLabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var setCountLabel: UILabel!
    
    fileprivate var setCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initUI()
        reset()
    }

    func initUI() {
        timeLabel.maxInterval = 5
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
    
    fileprivate func updateSetCountUI() {
        setCountLabel.text = "\(setCount)"
    }
}

