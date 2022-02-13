//
//  trash.swift
//  Shulte
//
//  Created by Марк Акиваев on 29.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import Foundation


//func makeButton() -> UIButton {
//
//    let button: UIButton = CustomButton()
////        button.translatesAutoresizingMaskIntoConstraints = false
//    button.addTarget(self, action: #selector(touchButton(sender:)), for: .touchDown)
////        button.backgroundColor = .white
////        button.setTitleColor(.black, for: .normal)
//    view.addSubview(button)
//
//    return button
//}


//let startButton: UIButton = {
////        let button = UIButton()
//    let button: UIButton = RoundedButton()
////        button.translatesAutoresizingMaskIntoConstraints = false
//    button.addTarget(self, action: #selector(touchStart), for: .touchDown)
////        button.backgroundColor = .white
//    button.setTitle("Start", for: .normal)
////        button.setTitleColor(.black, for: .normal)
////        button.setTitleColor(.gray, for: .disabled)
////        button.clipsToBounds = true
////        button.layer.cornerRadius = 10
//    return button
//}()
//
//let fastEndButton: UIButton = {
////        let button = UIButton()
//    let button: UIButton = RoundedButton()
////        button.translatesAutoresizingMaskIntoConstraints = false
//    button.addTarget(self, action: #selector(touchEnd), for: .touchDown)
////        button.backgroundColor = .white
//    button.setTitle("Fast End", for: .normal)
////        button.setTitleColor(.black, for: .normal)
////        button.setTitleColor(.gray, for: .disabled)
////        button.clipsToBounds = true
////        button.layer.cornerRadius = 10
//    button.isEnabled = false
//    button.titleLabel?.font = .systemFont(ofSize: 10)
//    
//    return button
//}()


//let timerDescriptionLabel: UILabel = {
//    let label = UILabel()
//    label.translatesAutoresizingMaskIntoConstraints = false
//    label.clipsToBounds = true
//    label.layer.cornerRadius = 10
//    label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//    label.textColor = .black
//    label.font = .systemFont(ofSize: 17)
//    label.backgroundColor = UIColor(white: 0.9, alpha: 1)
//    label.textAlignment = .center
//    label.layer.shadowRadius = 0
//    
//    label.text = "Time"
//    return label
//}()
//
//let timerLabel: UILabel = {
//    let timerLabel = UILabel()
//    timerLabel.translatesAutoresizingMaskIntoConstraints = false
////        timerLabel.clipsToBounds = true
////        timerLabel.layer.cornerRadius = 10
////        timerLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//    timerLabel.textColor = .black
//    timerLabel.font = .systemFont(ofSize: 17)
//    timerLabel.backgroundColor = UIColor(white: 0.9, alpha: 1)
//    timerLabel.textAlignment = .center
//    timerLabel.layer.shadowRadius = 0
//    
//    
//    return timerLabel
//}()
//
//
//let recordDescriptionLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.clipsToBounds = true
//        label.layer.cornerRadius = 10
//        label.layer.maskedCorners = []
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 14)
//        label.backgroundColor = UIColor(white: 0.9, alpha: 1)
//        label.textAlignment = .center
//        label.layer.shadowRadius = 0
//        
//        label.text = "Record"
//        return label
//}()
//
//let recordLabel: UILabel = {
//    let recordLabel = UILabel()
//    recordLabel.translatesAutoresizingMaskIntoConstraints = false
//    recordLabel.clipsToBounds = true
//    recordLabel.layer.cornerRadius = 10
//    recordLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//    recordLabel.textColor = .black
//    recordLabel.font = .systemFont(ofSize: 14)
//    recordLabel.backgroundColor = UIColor(white: 0.9, alpha: 1)
//    recordLabel.textAlignment = .center
//    recordLabel.layer.shadowRadius = 0
//    
//    
//    return recordLabel
//}()
//
//let startLabel: UILabel = {
//    let startLabel = UILabel()
//    startLabel.translatesAutoresizingMaskIntoConstraints = false
//    startLabel.clipsToBounds = true
//    startLabel.layer.cornerRadius = 10
//    startLabel.textColor = .black
//    startLabel.backgroundColor = UIColor(white: 0.9, alpha: 1)
//    startLabel.textAlignment = .center
//    startLabel.layer.shadowRadius = 0
//    startLabel.font = .systemFont(ofSize: 25)
//    
//    return startLabel
//}()
//
//
//let labelShult: UILabel = {
//    let label = UILabel()
//    label.translatesAutoresizingMaskIntoConstraints = false
//    label.backgroundColor = UIColor(white: 0.9, alpha: 1)
//    label.textColor = UIColor(displayP3Red: 0, green: 0.5, blue: 1, alpha: 1)
//    label.font = .boldSystemFont(ofSize: 26)
//    label.shadowColor = .cyan
//    label.textAlignment = .center
//    label.text = "-"
//    label.clipsToBounds = true
//    label.layer.cornerRadius = 10
//    label.alpha = 0
//    return label
//}()
