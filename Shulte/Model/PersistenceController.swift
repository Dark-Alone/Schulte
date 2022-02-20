//
//  Persintent.swift
//  Shulte
//
//  Created by Марк Акиваев on 2/20/22.
//  Copyright © 2022 Марк Акиваев. All rights reserved.
//

import Foundation
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Shulte")
        
        container.loadPersistentStores { storeDescription, err in
            if let err = err {
                print(err)
            }
        }
    }
    
    func saveContext() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}
