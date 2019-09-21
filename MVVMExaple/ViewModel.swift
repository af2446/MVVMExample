//
//  ViewModel.swift
//  MVVMExaple
//
//  Created by aviv frenkel on 06/09/2019.
//  Copyright © 2019 aviv frenkel. All rights reserved.
//

import Foundation

class ViewModel {
    var switchText = Box<String>("switch is ON")
    var randomText = Box<String>("")
    weak var timer: Timer?
    
    func startOrStopInterval() {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        } else {
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(generateRandomUUID), userInfo: nil, repeats: true)
        }
        
    }


    @objc private func generateRandomUUID() {
        randomText.value = UUID().uuidString

    }
    
    
}
