//
//  TableShulteView.swift
//  Shulte
//
//  Created by Марк Акиваев on 30.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit

class TableShulteView: UIView {
    
    var segmentedShulte: UISegmentedControl?
    var startButton: UIButton?
    
    
    let timerDescriptionLabel: UILabel = {
        
        let timerDescriptionLabel = CustomLabel()
//        let label = CustomLabel()
        timerDescriptionLabel.layer.maskedCorners = [.layerMinXMaxYCorner]
        timerDescriptionLabel.font = .systemFont(ofSize: 17)
        
        timerDescriptionLabel.text = "Time"
        return timerDescriptionLabel
    }()
    
    let timerLabel: UILabel = {
//        let timerLabel: UILabel = RoundedLabel()
        let timerLabel: UILabel = CustomLabel()
//        timerLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        timerLabel.font = .systemFont(ofSize: 17)
        timerLabel.text = "-"
        
        return timerLabel
    }()
    
    
    let recordDescriptionLabel: UILabel = {
//        let label: UILabel = RoundedLabel()
        let recordDescriptionLabel: UILabel = CustomLabel()
//       label.layer.maskedCorners = []
        recordDescriptionLabel.font = .systemFont(ofSize: 14)
        recordDescriptionLabel.text = "Record"
        
       return recordDescriptionLabel
    }()
    
    let recordLabel: UILabel = {
        let recordLabel: UILabel = RoundedLabel()
        recordLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        recordLabel.font = .systemFont(ofSize: 14)
        recordLabel.text = "-"
        
        return recordLabel
    }()
    
    let startLabel: UILabel = {
        let startLabel: UILabel = RoundedLabel()
        startLabel.font = .systemFont(ofSize: 25)
        
        return startLabel
    }()
    
   
    let labelShult: UILabel = {
        let labelShult: UILabel = RoundedLabel()
        labelShult.textColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        labelShult.font = .boldSystemFont(ofSize: 26)
        labelShult.text = "-"
        labelShult.alpha = 0
        return labelShult
    }()
    
    required init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubviewsToTableShulte() {
        
        // 1...n*n - labelShulte
        //
        
        // Time   - timerDescriptionLabel
        // 12s    - timerLabel
        // Record - recordDescriptionLabel
        // 12s    - recordLabel
        
        addSubview(startLabel)
        addSubview(timerDescriptionLabel)
        addSubview(timerLabel)
        addSubview(recordDescriptionLabel)
        addSubview(recordLabel)
        
        
        
        
//        addSubview(startButton)
//        addSubview(segmentedShulte)
    }
    
    func setControls(button: UIButton, segmented: UISegmentedControl) {
        startButton = button
        segmentedShulte = segmented
        if let startButton = startButton, let segmentedShulte = segmentedShulte {
            addSubview(startButton)
            addSubview(segmentedShulte)
        }
    }
    
}
