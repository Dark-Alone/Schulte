//
//  objcMethods.swift
//  Shulte
//
//  Created by Марк Акиваев on 30.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit


extension ShulteVC {
    
    @objc func changeTime() {
        
        UIView.transition(with: startLabel, duration: 0.05, options: .transitionCrossDissolve, animations: {
            self.startLabel.text = "\(self.countdown)"
        }, completion: nil)
        
        if countdown == 0 {
            gameStart()
        }
        
        print("\(countdown)")
        countdown -= 1
        
        
        
    }
    
    @objc func touchStart() {
        print("Start")
        
        segmentedShulte.isEnabled = false

        startButton.isEnabled = false
        fastEndButton.isEnabled = true
        fastEndButton.isHidden = false
        rehideLabels()
        
//        countdown = 3
        countdown = 3
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeTime), userInfo: nil, repeats: true)
    }
    
    @objc func touchEnd() {
        
        fastEndButton.isEnabled = false
        
        let _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (_) in
            if let timer = self.timer {
                timer.invalidate()
            }
            self.gameEnd(isFast: true)
        }
    }
    
    @objc func touchButton(sender: UIButton) {
        touches += 1
        if String(numberShult) == sender.titleLabel?.text {
            numberShult += 1
            
            changeLabelShulteText(text: "\(numberShult)")
            
            UIView.animate(withDuration: 0.4, animations: {
                sender.backgroundColor = UIColor(displayP3Red: 0.6, green: 1, blue: 0.6, alpha: 1)
            }) { (_) in
                UIView.animate(withDuration: 0.6) {
                    sender.backgroundColor = .white
                }
            }
            print("yes! \(numberShult)")
            if numberShult > dimension * dimension {
                gameEnd()
            }
        }
    }
    
    
    
    @objc func changeSize(_ sender: UISegmentedControl) {
        dimension = sender.selectedSegmentIndex + 5
        valueChanged = true
    }
    
    
}
