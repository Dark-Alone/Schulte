//
//  TableShulteView.swift
//  Shulte
//
//  Created by Марк Акиваев on 30.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit

class TableShulteView: UIView {
    let startButton: UIButton = RoundedButton(title: "Start", font: .preferredFont(forTextStyle: .body))
    
    // TODO: Rename countdown on gameResults labels
    // last game results label
    let countdownTimerDescriptionLabel: UILabel = RoundedLabel(title: "Time", font: .systemFont(ofSize: 17))
    let countdownTimerLabel: UILabel = CustomLabel(title: "-", font: .systemFont(ofSize: 17))
    
    // record game results label
    let recordDescriptionLabel: UILabel = CustomLabel(title: "Record", font: .systemFont(ofSize: 14))
    let recordLabel: UILabel = RoundedLabel(title: "-", font: .systemFont(ofSize: 14))
    
    // countdown at the start of game label
    let startLabel: UILabel = RoundedLabel(title: "", font: .systemFont(ofSize: 25))
    
    // segment to choose size for game table (5x5 etc.)
    let segmentedShulte: UISegmentedControl = SegmentedSizeChoise(items: ["5", "6", "7", "8"])
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false

        self.backgroundColor = UIColor(white: 0.7, alpha: 1)
        self.isHidden = false
        self.layer.cornerRadius = 10
        
        self.addSubviews()
        
        
        // labels masked cordners
        countdownTimerDescriptionLabel.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        recordLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.addSubview(startLabel)
        self.addSubview(countdownTimerDescriptionLabel)
        self.addSubview(countdownTimerLabel)
        self.addSubview(recordDescriptionLabel)
        self.addSubview(recordLabel)

        self.addSubview(startButton)
        self.addSubview(segmentedShulte)
    }
    
    func showLabels(show: CGFloat) {
        countdownTimerLabel.alpha = show
        countdownTimerDescriptionLabel.alpha = show
        recordLabel.alpha = show
        recordDescriptionLabel.alpha = show
    }
}

extension TableShulteView {
    
    // called by ShulteVC when tableShulteView layout in it
    func layout(safeAreaWidth sAW: CGFloat) {
        let countdownTimersWidth = sAW / 3
        
        // Custom font size for startLabel to match layout
        let startLabelFontSize = CGFloat(countdownTimersWidth / 1.5)
        startLabel.font = .systemFont(ofSize: startLabelFontSize)
        
        // label height constant
        let recordLabelHeight: CGFloat = (1 / 15) * sAW
        
        countdownTimerDescriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: sAW / 3).isActive = true
        countdownTimerDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        countdownTimerDescriptionLabel.widthAnchor.constraint(equalToConstant: countdownTimersWidth).isActive = true
        countdownTimerDescriptionLabel.heightAnchor.constraint(equalToConstant: recordLabelHeight * 1.5).isActive = true
        
        
        countdownTimerLabel.topAnchor.constraint(equalTo: countdownTimerDescriptionLabel.bottomAnchor).isActive = true
        countdownTimerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        countdownTimerLabel.widthAnchor.constraint(equalToConstant: countdownTimersWidth).isActive = true
        countdownTimerLabel.heightAnchor.constraint(equalToConstant: recordLabelHeight * 1.5).isActive = true
        
        
        recordDescriptionLabel.topAnchor.constraint(equalTo: countdownTimerLabel.bottomAnchor).isActive = true
        recordDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        recordDescriptionLabel.widthAnchor.constraint(equalToConstant: countdownTimersWidth).isActive = true
        recordDescriptionLabel.heightAnchor.constraint(equalToConstant: recordLabelHeight).isActive = true
        
        
        recordLabel.topAnchor.constraint(equalTo: recordDescriptionLabel.bottomAnchor).isActive = true
        recordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        recordLabel.widthAnchor.constraint(equalToConstant: countdownTimersWidth).isActive = true
        recordLabel.heightAnchor.constraint(equalToConstant: recordLabelHeight).isActive = true
        
        // startLabel overlays other labels
        startLabel.topAnchor.constraint(equalTo: countdownTimerDescriptionLabel.topAnchor).isActive = true
        startLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        startLabel.widthAnchor.constraint(equalTo: recordLabel.widthAnchor).isActive = true
        startLabel.bottomAnchor.constraint(equalTo: recordLabel.bottomAnchor).isActive = true
        
        
        startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(10 + sAW / 28)).isActive = true
        startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: sAW / 6).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: sAW / 12).isActive = true
        
        
        segmentedShulte.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -(sAW / 28)).isActive = true
        segmentedShulte.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        segmentedShulte.heightAnchor.constraint(equalToConstant: sAW / 12).isActive = true
        segmentedShulte.widthAnchor.constraint(equalToConstant: sAW / 3).isActive = true
    }
}
