//
//  game.swift
//  Shulte
//
//  Created by Марк Акиваев on 30.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit


extension ShulteVC {
    
    // TODO: Remove junk
    func generateNewTable() {
        if gameModel.dimensionChanged {
            // recreation buttons for new size
            removeButtons()
            generateButtons()
            // update value for next iteration
            gameModel.dimensionChanged = false
        }
        
        let sequence = 1...(gameModel.dimension * gameModel.dimension)
        var numbers: [Int] = sequence.shuffled()
        
        layoutManager.buttons.forEach { (button) in
            let randElement = numbers.removeLast()
            button.setTitle("\(randElement)", for: .normal)
        }
    }
    
    func gameStart() {
        generateNewTable()

        if let countdownTimer = self.countdownTimer {
            countdownTimer.invalidate()
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.tableShulte.alpha = 0
        }) { (_) in
            self.tableShulte.isHidden = true
            self.tableShulte.startLabel.text = ""
            
            self.gameModel.startTime = Date()
        }
        
        changeLabelShulteText(text: "1", duration: 0.5)
    }
    
    func saveResult() {
        let time = gameModel.endTheGame()
        tableShulte.countdownTimerLabel.text = String(format: "%.1fs", time)
    }
    
    // fast end button?
    func gameEnd(isFast: Bool = false) {
        tableShulte.segmentedShulte.isEnabled = true
        
        // try to change functions order
        rehideLabels(0) // without animation
        
        tableShulte.startButton.isEnabled = true
        
        fastEndButton?.isEnabled = false
        fastEndButton?.isHidden = true
        
        changeLabelShulteText(text: "-")
        
        if (!isFast) {
            saveResult()
        } else {
            tableShulte.countdownTimerLabel.text = "-"
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.tableShulte.isHidden = false
            self.tableShulte.alpha = 1
        }) { (_) in}
        
        // make replayable game
        gameModel.currentNumber = 1
    }
}
