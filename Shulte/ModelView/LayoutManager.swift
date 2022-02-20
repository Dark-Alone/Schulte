//
//  LayoutManager.swift
//  Shulte
//
//  Created by Марк Акиваев on 2/18/22.
//  Copyright © 2022 Марк Акиваев. All rights reserved.
//

import UIKit

class LayoutManager {
    
    // safeAreaHeight
    var sAH: CGFloat = 0
    // safeAreaWidth
    var sAW: CGFloat = 0
    
    var buttons = [UIButton]()
    var buttonsConstraints = [NSLayoutConstraint]()
    
    // ??
    weak var gameModel: GameModel?
}
