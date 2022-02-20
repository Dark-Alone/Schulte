//
//  RoundedLabel.swift
//  Shulte
//
//  Created by Марк Акиваев on 29.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit

class RoundedLabel: CustomLabel {
    
    override init(title: String, font: UIFont = .preferredFont(forTextStyle: .body)) {
        super.init(title: title, font: font)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.shadowRadius = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
