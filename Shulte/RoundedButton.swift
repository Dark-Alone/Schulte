//
//  RoundedButton.swift
//  Shulte
//
//  Created by Марк Акиваев on 29.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit

class RoundedButton: CustomButton {
    
    init(title: String, font: UIFont) {
        super.init(title: title)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        self.titleLabel?.font = font
    }
    
    required init?(coder: NSCoder) {
//        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
