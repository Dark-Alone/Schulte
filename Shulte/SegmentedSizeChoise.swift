//
//  SegmentedSizeChoise.swift
//  Shulte
//
//  Created by Марк Акиваев on 2/17/22.
//  Copyright © 2022 Марк Акиваев. All rights reserved.
//

import UIKit

class SegmentedSizeChoise: UISegmentedControl {
    
    init(items: [String]) {
        super.init(frame: .zero)
        
        for index in 0..<items.count {
            self.insertSegment(withTitle: items[index], at: index, animated: false)
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Custom appearance
        self.setTitleTextAttributes(
            [
                .font : UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor(white: 0, alpha: 1)
            ],
            for: .normal)
        
        self.selectedSegmentTintColor = UIColor(white: 1, alpha: 1)
        self.backgroundColor = UIColor(white: 0.6, alpha: 1)
        
        self.selectedSegmentIndex = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
