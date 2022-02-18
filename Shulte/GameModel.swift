//
//  GameModel.swift
//  Shulte
//
//  Created by Марк Акиваев on 2/18/22.
//  Copyright © 2022 Марк Акиваев. All rights reserved.
//

import UIKit

class GameModel {
    
    // variable shows current game status
    var onGame = false
    
    // Variables for calculation game time
    var startTime = Date()
    var endTime = Date()
    
    // dimension x dimension game state
    var dimension = 5
    var dimensionChanged = false
    
    // In game current number to tap
    var currentNumber: Int = 1
    
    // How many tries had been done to beat game
    var touches: Int = 0
    
    // game goal : tap miss
    var missclicks = [Int : Int]()
    
    // ???
    weak var layoutManager: LayoutManager?
    
    func endTheGame() -> Float {
        endTime = Date()
        
        return Float(endTime.timeIntervalSince(startTime))
    }
}
