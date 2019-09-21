//
//  ViewController.swift
//  MVVMExaple
//
//  Created by aviv frenkel on 06/09/2019.
//  Copyright © 2019 aviv frenkel. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    @IBOutlet weak var lblSwitchText: UILabel!
    @IBOutlet weak var lblRandomGenerator: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeBindings()
    }
    
    fileprivate func initializeBindings() {
        self.viewModel.randomText.bind { [unowned self] (newVal) in
            self.lblRandomGenerator.text = newVal
        }
        self.viewModel.switchText.bind { [unowned self] (newVal) in
            self.lblSwitchText.text = newVal
        }
    }

    @IBAction func switchAction(_ sender: UISwitch) {
        self.viewModel.switchText.value = sender.isOn ? "switch is ON" : "switch is OFF"
    }
    
    @IBAction func startIntervalAction(_ sender: UIButton) {
        self.viewModel.startOrStopInterval()
        sender.setTitle( (self.viewModel.timer != nil) ? "Stop Interval" : "Start Interval" , for: .normal)
    }
}


