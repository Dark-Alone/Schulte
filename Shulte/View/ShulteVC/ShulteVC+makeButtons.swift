//
//  generateButtons.swift
//  Shulte
//
//  Created by Марк Акиваев on 29.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit

extension ShulteVC {
    
    func generateButton() -> UIButton {
        let button: UIButton = CustomButton()
        
        button.addTarget(self, action: #selector(touchButton(sender:)), for: .touchDown)
        
        view.addSubview(button)
        
        return button
    }
    
    func generateButtons() {
        let safeArea = view.safeAreaLayoutGuide
        let sAW = layoutManager.sAW - 40
        let sAH = layoutManager.sAH
        
        let size = sAW / CGFloat(gameModel.dimension)
        
        for i in 0 ..< (gameModel.dimension * gameModel.dimension) {
            let button = generateButton()
            
            let widthConstraint = button.widthAnchor.constraint(equalToConstant: size)
            let heightConstraint = button.heightAnchor.constraint(equalToConstant: size)
            
            let leadingConstraint: NSLayoutConstraint
            let topConstraint: NSLayoutConstraint
            
            if (i % gameModel.dimension == 0) {
                leadingConstraint = button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
            } else {
                leadingConstraint = button.leadingAnchor.constraint(equalTo: layoutManager.buttons[i - 1].trailingAnchor)
            }
            
            if (i < gameModel.dimension) {
                topConstraint = button.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: (sAH - sAW) / 2)
            } else {
                topConstraint = button.topAnchor.constraint(equalTo: layoutManager.buttons[i - gameModel.dimension].bottomAnchor)
            }
            layoutManager.buttonsConstraints += [widthConstraint, heightConstraint, leadingConstraint, topConstraint]
            
            layoutManager.buttons.append(button)
        }
        
        NSLayoutConstraint.activate(layoutManager.buttonsConstraints)
        view.bringSubviewToFront(tableShulte)
    }
    
    func removeButtons() {
        NSLayoutConstraint.deactivate(layoutManager.buttonsConstraints)
        layoutManager.buttonsConstraints.removeAll()
        layoutManager.buttons.forEach {
            $0.removeFromSuperview()
        }
        layoutManager.buttons.removeAll()
    }
    
    // fast end button for test purposes
    func makeFastEndButton() {
        fastEndButton = RoundedButton(title: "Fast End", font: .systemFont(ofSize: 10))
        
        guard let fastEndButton = fastEndButton else { return }
        
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(fastEndButton)
        fastEndButton.topAnchor.constraint(equalTo: tableShulte.bottomAnchor, constant: 10).isActive = true
        fastEndButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        fastEndButton.widthAnchor.constraint(equalTo: tableShulte.startButton.widthAnchor).isActive = true
        
        fastEndButton.addTarget(self, action: #selector(touchEnd), for: .touchDown)
    }
}
