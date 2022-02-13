//
//  CustomButton.swift
//  Shulte
//
//  Created by Марк Акиваев on 29.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    required init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.gray, for: .disabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
