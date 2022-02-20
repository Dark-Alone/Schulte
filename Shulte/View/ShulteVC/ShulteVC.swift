//
//  ViewController.swift
//  Shulte
//
//  Created by Марк Акиваев on 15.09.2020.
//  Copyright © 2020 Марк Акиваев. All rights reserved.
//

import UIKit

class ShulteVC: UIViewController {
    // setup test mode
    let testApp = true
    
    // timer for countdown before game starts
    var countdownTimer: Timer?
    var countdown = 3
    
    // Setup view models
    var gameModel = GameModel()
    var layoutManager = LayoutManager()
    
    // overlay view to show game results and for start new game
    let tableShulte = TableShulteView()
    
    // label show which number player must tap
    let labelShulte: UILabel = RoundedLabel(title: "-", font: .systemFont(ofSize: 26, weight: .bold))
    
    // button for test purpose
    var fastEndButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safeArea = view.safeAreaLayoutGuide
        layoutManager.sAW = safeArea.layoutFrame.width
        layoutManager.sAH = safeArea.layoutFrame.height
        
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        let size = (layoutManager.sAW - 40) / CGFloat(gameModel.dimension)
        generateButtons()
        makeTableShulte(size: size)
        makeLabelShulte()
        
        addTargertToButtons()
        specifySubviews()
        
        // only if app is testing
        if testApp {
            makeFastEndButton()
        }
    }
    
    func makeLabelShulte() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(labelShulte)
        
        changeLabelShulteText(text: "-")
        labelShulte.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        labelShulte.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: (layoutManager.sAH - layoutManager.sAW) / 4 + 20).isActive = true
        labelShulte.widthAnchor.constraint(equalToConstant: 40).isActive = true
        labelShulte.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    func addTargertToButtons() {
        tableShulte.startButton.addTarget(self, action: #selector(touchStart), for: .touchDown)
        tableShulte.segmentedShulte.addTarget(self, action: #selector(changeSize(_:)), for: .valueChanged)
    }
    
    func specifySubviews() {
        // fastEndButton
        fastEndButton?.isEnabled = false
        
        // labelShulte
        labelShulte.textColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        labelShulte.alpha = 0
    }
    
    func changeLabelShulteText(text: String, duration: TimeInterval = 0.5) {
        // 0.3
        UIView.transition(with: labelShulte, duration: duration, options: .transitionCrossDissolve, animations: {
            self.labelShulte.text = text
        }, completion: nil)
    }
    
    func rehideLabels(_ duration: TimeInterval = 0.5) {
        let show = gameModel.onGame ? 1 : 0
        gameModel.onGame.toggle()
//        self.startLabel.isHidden = self.isHidden
        
        UIView.animate(withDuration: duration, delay: 0, options: []) {
            self.tableShulte.showLabels(show: CGFloat(show))
            self.labelShulte.alpha = CGFloat(abs(show - 1))
        } completion: { (_) in }
    }
    
    
    func breakGame() { }
    func saveGame() { }
}
