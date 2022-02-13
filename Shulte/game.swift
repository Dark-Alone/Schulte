//
//  game.swift
//  Shulte
//
//  Created by Марк Акиваев on 30.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit


extension ShulteVC {
    
    func gameStart() {
        
        generateNewShulte()
        
//        startLabel.text = 
        if let timer = self.timer {
            timer.invalidate()
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.tableShulte.alpha = 0
        }) { (_) in
            self.tableShulte.isHidden = true
            self.startLabel.text = ""
            self.startTime = Date()
        }
        changeLabelShulteText(text: "1", duration: 0.5)
    }
    
    func saveResult() {
        endTime = Date()
        let time = Float(endTime.timeIntervalSince(startTime))
        timerLabel.text = String(format: "%.1fs", time)
    }
    
    func gameEnd(isFast: Bool = false) {
        
        segmentedShulte.isEnabled = true
        
        isHidden = true
        rehideLabels(0)
        startButton.isEnabled = true
        fastEndButton.isEnabled = false
        fastEndButton.isHidden = true
        
        numberShult = 1
        
        changeLabelShulteText(text: "-")
        
        if (!isFast) {
            saveResult()
        } else {
            timerLabel.text = "-"
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.tableShulte.isHidden = false
            self.tableShulte.alpha = 1
        }) { (_) in
            
        }
        numberShult = 1
    }
}
