//
//  objcMethods.swift
//  Shulte
//
//  Created by Марк Акиваев on 30.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit


extension ShulteVC {
    
    // Timer countdown function
    @objc func changeTime() {
        UIView.transition(with: tableShulte.startLabel, duration: 0.05, options: .transitionCrossDissolve, animations: {
            self.tableShulte.startLabel.text = "\(self.countdown)"
        }, completion: nil)
        
        if countdown == 0 {
            tableShulte.startLabel.text = ""
            gameStart()
        }
        
        print("\(countdown)")
        countdown -= 1
    }
    
    @objc func touchStart() {
        print("Start")
        
        tableShulte.segmentedShulte.isEnabled = false
        tableShulte.startButton.isEnabled = false
        
        fastEndButton?.isEnabled = true
        fastEndButton?.isHidden = false
        
        rehideLabels()
        
        countdown = 3
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeTime), userInfo: nil, repeats: true)
    }
    
    // fast end button
    @objc func touchEnd() {
        fastEndButton?.isEnabled = false
        
        let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
            if let countdownTimer = self.countdownTimer {
                countdownTimer.invalidate()
            }
            self.gameEnd(isFast: true)
        }
    }
    
    // touch game button
    @objc func touchButton(sender: UIButton) {
        gameModel.touches += 1
        
        // for reuse
        let senderText = sender.titleLabel?.text
        
        if String(gameModel.currentNumber) == senderText {
            gameModel.currentNumber += 1
            changeLabelShulteText(text: "\(gameModel.currentNumber)")
            
            // Green background animation
            UIView.animate(withDuration: 0.4, animations: {
                sender.backgroundColor = UIColor(displayP3Red: 0.6, green: 1, blue: 0.6, alpha: 1)
            }) { (_) in
                UIView.animate(withDuration: 0.6) {
                    sender.backgroundColor = .white
                }
            }
            print("yes! \(gameModel.currentNumber)")
            
            if gameModel.currentNumber > (gameModel.dimension * gameModel.dimension) {
                gameEnd()
            }
        } else {
            // TODO: save the missclick information
            
        }
    }
    
    @objc func changeSize(_ sender: UISegmentedControl) {
        gameModel.dimension = sender.selectedSegmentIndex + 5
        gameModel.dimensionChanged = true
    }
}
