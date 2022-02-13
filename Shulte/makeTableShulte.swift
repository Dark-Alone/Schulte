//
//  makeTableShulte.swift
//  Shulte
//
//  Created by Марк Акиваев on 29.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit


extension ShulteVC {
    
    func addSubviewsToTableShulte() {
        
        // 1...n*n - labelShulte
        // 
        
        // Time   - timerDescriptionLabel
        // 12s    - timerLabel
        // Record - recordDescriptionLabel
        // 12s    - recordLabel
        
        tableShulte.addSubview(startLabel)
        tableShulte.addSubview(timerDescriptionLabel)
        tableShulte.addSubview(timerLabel)
        tableShulte.addSubview(recordDescriptionLabel)
        tableShulte.addSubview(recordLabel)
        
        
        
        
        tableShulte.addSubview(startButton)
        tableShulte.addSubview(segmentedShulte)
    }
    
    func makeTableShulte(size: CGFloat) {
        let safeArea = view.safeAreaLayoutGuide
        let sAW = safeAreaWidth - 40
        let widthTimers = sAW / 3
        
        let startLabelFontSize = CGFloat(widthTimers / 1.5)
        
        startLabel.font = .systemFont(ofSize: startLabelFontSize)
        
        let x: CGFloat = (1 / 15) * sAW
        
        view.addSubview(tableShulte)
        view.bringSubviewToFront(tableShulte)
        
        tableShulte.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10).isActive = true
        tableShulte.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: (safeAreaHeight - sAW) / 2 - 10).isActive = true
        tableShulte.widthAnchor.constraint(equalToConstant: sAW + 20).isActive = true
        tableShulte.heightAnchor.constraint(equalToConstant: sAW + 20).isActive = true
        
        addSubviewsToTableShulte()
        
        
//        timerDescriptionLabel.backgroundColor = UIColor(white: 0.6, alpha: 1)
//        timerLabel.backgroundColor = UIColor(white: 0.7, alpha: 1)
//        recordDescriptionLabel.backgroundColor = UIColor(white: 0.8, alpha: 1)
//        recordLabel.backgroundColor = UIColor(white: 1, alpha: 1)
        
        
        
        timerDescriptionLabel.topAnchor.constraint(equalTo: tableShulte.topAnchor, constant: sAW / 3).isActive = true
        timerDescriptionLabel.centerXAnchor.constraint(equalTo: tableShulte.centerXAnchor).isActive = true
        timerDescriptionLabel.widthAnchor.constraint(equalToConstant: widthTimers).isActive = true
        timerDescriptionLabel.heightAnchor.constraint(equalToConstant: x * 1.5).isActive = true
        
        
        timerLabel.topAnchor.constraint(equalTo: timerDescriptionLabel.bottomAnchor).isActive = true
        timerLabel.centerXAnchor.constraint(equalTo: tableShulte.centerXAnchor).isActive = true
        timerLabel.widthAnchor.constraint(equalToConstant: widthTimers).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: x * 1.5).isActive = true
        
        
        recordDescriptionLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor).isActive = true
        recordDescriptionLabel.centerXAnchor.constraint(equalTo: tableShulte.centerXAnchor).isActive = true
        recordDescriptionLabel.widthAnchor.constraint(equalToConstant: widthTimers).isActive = true
        recordDescriptionLabel.heightAnchor.constraint(equalToConstant: x).isActive = true
        
        
        recordLabel.topAnchor.constraint(equalTo: recordDescriptionLabel.bottomAnchor).isActive = true
        recordLabel.centerXAnchor.constraint(equalTo: tableShulte.centerXAnchor).isActive = true
        recordLabel.widthAnchor.constraint(equalToConstant: widthTimers).isActive = true
        recordLabel.heightAnchor.constraint(equalToConstant: x).isActive = true
        
        startLabel.topAnchor.constraint(equalTo: timerDescriptionLabel.topAnchor).isActive = true
        startLabel.centerXAnchor.constraint(equalTo: tableShulte.centerXAnchor).isActive = true
        startLabel.widthAnchor.constraint(equalTo: recordLabel.widthAnchor).isActive = true
        startLabel.bottomAnchor.constraint(equalTo: recordLabel.bottomAnchor).isActive = true
        
        
        
        startButton.bottomAnchor.constraint(equalTo: tableShulte.bottomAnchor, constant: -(10 + sAW / 28)).isActive = true
        startButton.centerXAnchor.constraint(equalTo: tableShulte.centerXAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: sAW / 6).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: sAW / 12).isActive = true
        
        
        segmentedShulte.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -(sAW / 28)).isActive = true
        segmentedShulte.centerXAnchor.constraint(equalTo: tableShulte.centerXAnchor).isActive = true
        segmentedShulte.heightAnchor.constraint(equalToConstant: sAW / 12).isActive = true
        segmentedShulte.widthAnchor.constraint(equalToConstant: sAW / 3).isActive = true

    }
}
