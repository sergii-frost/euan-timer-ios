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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initUI()
    }

    func initUI() {
        timeLabel.maxInterval = 5
    }
    
    @IBAction func startTimer() {
        timeLabel.start()
    }
}

