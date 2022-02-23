//
//  CustomLabel.swift
//  Shulte
//
//  Created by Марк Акиваев on 29.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    init(title: String, font: UIFont = .preferredFont(forTextStyle: .body)) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.textAlignment = .center
        
        self.text = title
        self.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
