//
//  makeTableShulte.swift
//  Shulte
//
//  Created by Марк Акиваев on 29.04.2021.
//  Copyright © 2021 Марк Акиваев. All rights reserved.
//

import UIKit


extension ShulteVC {
    
    func makeTableShulte(size: CGFloat) {
        let safeArea = view.safeAreaLayoutGuide
        let sAW = layoutManager.sAW - 40
        
        view.addSubview(tableShulte)
        view.bringSubviewToFront(tableShulte)
        
        tableShulte.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10).isActive = true
        tableShulte.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: (layoutManager.sAH - sAW) / 2 - 10).isActive = true
        tableShulte.widthAnchor.constraint(equalToConstant: sAW + 20).isActive = true
        tableShulte.heightAnchor.constraint(equalToConstant: sAW + 20).isActive = true
        
        tableShulte.layout(safeAreaWidth: sAW)
    }
}
