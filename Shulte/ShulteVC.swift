//
//  ViewController.swift
//  Shulte
//
//  Created by Марк Акиваев on 15.09.2020.
//  Copyright © 2020 Марк Акиваев. All rights reserved.
//

import UIKit

class ShulteVC: UIViewController {
    
    var timer: Timer?
    
    var dimension = 5
    var countdown = 3
    var buttons = [UIButton]()
    var buttonsConstaints = [NSLayoutConstraint]()
    var touches = 0
    
    
    var valueChanged = false
    var isHidden = false
    
    var numberShult: Int = 1
    
    var startTime = Date()
    var endTime = Date()
    
    var safeAreaHeight: CGFloat = 0
    var safeAreaWidth: CGFloat = 0
    
    let startButton: UIButton = {
        let startButton: UIButton = RoundedButton()
        startButton.addTarget(self, action: #selector(touchStart), for: .touchDown)
        startButton.setTitle("Start", for: .normal)
        return startButton
    }()
    
    let fastEndButton: UIButton = {
        
        let fastEndButton: UIButton = RoundedButton()
        fastEndButton.addTarget(self, action: #selector(touchEnd), for: .touchDown)
        fastEndButton.setTitle("Fast End", for: .normal)
        fastEndButton.isEnabled = false
        fastEndButton.titleLabel?.font = .systemFont(ofSize: 10)
        
        return fastEndButton
    }()
    
    let timerDescriptionLabel: UILabel = {
        
        let timerDescriptionLabel = RoundedLabel()
//        let label = CustomLabel()
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
    
    let circlePoint: UIView = {
        let circlePoint = UIView()
        circlePoint.translatesAutoresizingMaskIntoConstraints = false
        circlePoint.layer.cornerRadius = 16
        circlePoint.clipsToBounds = true
        circlePoint.backgroundColor = .cyan
        return circlePoint
    }()
    
    let tableShulte: UIView = {
        let tableShulte = UIView()
        tableShulte.translatesAutoresizingMaskIntoConstraints = false
        tableShulte.backgroundColor = UIColor(white: 0.7, alpha: 1)
        tableShulte.isHidden = false
        tableShulte.layer.cornerRadius = 10

        return tableShulte
    }()
    
    let segmentedShulte: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["5", "6", "7", "8"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(changeSize(_:)), for: .valueChanged)
        segmentedControl.setTitleTextAttributes(
            [.font : UIFont.systemFont(ofSize: 16),
             .foregroundColor: UIColor(white: 0, alpha: 1)], for: .normal)
        segmentedControl.selectedSegmentTintColor = UIColor(white: 1, alpha: 1)
        segmentedControl.backgroundColor = UIColor(white: 0.6, alpha: 1)
        return segmentedControl
    }()
    
    
    
    var numbers: [Int] = []
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        segmentedShulte.selectedSegmentIndex = 0
        
        let safeArea = view.safeAreaLayoutGuide
        safeAreaWidth = safeArea.layoutFrame.width
        safeAreaHeight = safeArea.layoutFrame.height

        print(view.bounds.height)
        
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        let size = (safeArea.layoutFrame.width - 40) / CGFloat(dimension)
        makeButtons()
        makeTableShulte(size: size)
        makeLabelShult()
        makeFastEndButton()
    }
    
    func makeCirclePoint() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(circlePoint)
        view.bringSubviewToFront(circlePoint)
        circlePoint.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        circlePoint.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        circlePoint.widthAnchor.constraint(equalToConstant: 10).isActive = true
        circlePoint.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    
    
    func generateNewShulte() {
        if (valueChanged) {
            deleteButtons()
            makeButtons()
            valueChanged = false
        }
        
        let sequence = 1...dimension * dimension
        numbers = sequence.shuffled()
        
        buttons.forEach { (button) in
            let randElement = numbers.randomElement()!
            button.setTitle("\(randElement)", for: .normal)
            numbers.remove(at: numbers.firstIndex(of: randElement)!)
        }
    }
    
    func makeLabelShult() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(labelShult)
        
        changeLabelShulteText(text: "-")
        labelShult.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        labelShult.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: (safeAreaHeight - safeAreaWidth) / 4 + 20).isActive = true
        labelShult.widthAnchor.constraint(equalToConstant: 40).isActive = true
        labelShult.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    
    func changeLabelShulteText(text: String, duration: TimeInterval = 0.5) {
        // 0.3
        UIView.transition(with: labelShult, duration: duration, options: .transitionCrossDissolve, animations: {
            self.labelShult.text = text
        }, completion: nil)
    }
    
    func rehideTableShulte(afterFunction: @escaping () -> Void ) {
        let show = isHidden ? 0 : 1
        UIView.animate(withDuration: 0) {
            self.tableShulte.alpha = CGFloat(show)
        } completion: { (_) in
            self.tableShulte.isHidden = self.isHidden
            afterFunction()
        }
    }
    
    func rehideLabels(_ duration: TimeInterval = 0.5) {
        let show = isHidden ? 1 : 0
        isHidden = !isHidden
//        self.startLabel.isHidden = self.isHidden
        
        UIView.animate(withDuration: duration, delay: 0, options: []) {
            self.timerLabel.alpha = CGFloat(show)
            self.timerDescriptionLabel.alpha = CGFloat(show)
            self.recordLabel.alpha = CGFloat(show)
            self.recordDescriptionLabel.alpha = CGFloat(show)
            self.startLabel.alpha = CGFloat(abs(show - 1))
            self.labelShult.alpha = CGFloat(abs(show - 1))
        } completion: { (_) in
//            self.rehideTableShulte()
        }

//        UIView.animate(withDuration: duration, animations: {
//            self.timerLabel.alpha = CGFloat(show)
//            self.timerDescriptionLabel.alpha = CGFloat(show)
//            self.recordLabel.alpha = CGFloat(show)
//            self.recordDescriptionLabel.alpha = CGFloat(show)
//            self.startLabel.alpha = CGFloat(abs(show - 1))
//            self.labelShult.alpha = CGFloat(abs(show - 1))
//        }) { (_) in}
    }
    
    
    func breakGame() { }
    func saveGame() { }
}
