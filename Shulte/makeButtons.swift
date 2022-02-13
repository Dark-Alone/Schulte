//
//  makeButtons.swift
//  Shulte
//
//  Created by Марк Акиваев on 29.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit

extension ShulteVC {
    
    func makeButton() -> UIButton {
        
        let button: UIButton = CustomButton()
        
        button.addTarget(self, action: #selector(touchButton(sender:)), for: .touchDown)
        
        view.addSubview(button)
        
        return button
    }
    
    func makeFastEndButton() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(fastEndButton)
        fastEndButton.topAnchor.constraint(equalTo: tableShulte.bottomAnchor, constant: 10).isActive = true
        fastEndButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        fastEndButton.widthAnchor.constraint(equalTo: startButton.widthAnchor).isActive = true
    }
    
    func makeButtons() {
        let safeArea = view.safeAreaLayoutGuide
        let sAW = safeAreaWidth - 40
        let sAH = safeAreaHeight
        
        let size = sAW / CGFloat(dimension)
        
        for i in 0 ..< (dimension * dimension) {
            let button = makeButton()
            let widthConstraint = button.widthAnchor.constraint(equalToConstant: size)
            let heightConstraint = button.heightAnchor.constraint(equalToConstant: size)
            let leadingConstraint: NSLayoutConstraint
            let topConstraint: NSLayoutConstraint
            if (i % dimension == 0) {
                leadingConstraint = button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
            } else {
                leadingConstraint = button.leadingAnchor.constraint(equalTo: buttons[i - 1].trailingAnchor)
            }
            if (i < dimension) {
                topConstraint = button.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: (sAH - sAW) / 2)
            } else {
                topConstraint = button.topAnchor.constraint(equalTo: buttons[i - dimension].bottomAnchor)
            }
            buttonsConstaints += [widthConstraint, heightConstraint, leadingConstraint, topConstraint]
            
            buttons.append(button)
        }
        
        NSLayoutConstraint.activate(buttonsConstaints)
        view.bringSubviewToFront(tableShulte)
//        view.bringSubviewToFront(circlePoint)
    }
    
    func deleteButtons() {
        NSLayoutConstraint.deactivate(buttonsConstaints)
        buttonsConstaints.removeAll()
        buttons.forEach {
            $0.removeFromSuperview()
        }
        buttons.removeAll()
    }
}
