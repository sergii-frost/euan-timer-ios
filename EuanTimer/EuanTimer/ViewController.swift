//
//  ViewController.swift
//  EuanTimer
//
//  Created by Sergii Frost on 2018-03-18.
//  Copyright © 2018 Frost°. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timeLabel: EUTimeLabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initUI()
    }

    func initUI() {
        
    }
    
    @IBAction func startTimer() {
        timeLabel.start()
    }
}

