//
//  DBManager.swift
//  CoreDataExample
//
//  Created by Sun on 10/12/2021.
//

import UIKit
import CoreData

protocol DBManagerType {
    var viewContext: NSManagedObjectContext { get }
    func save()
    func fetch() -> [User] 
}

final class DBManager: DBManagerType {
    
    static let shared: DBManagerType = DBManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataExample")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
        
    lazy var viewContext = persistentContainer.viewContext
    
    func save() {
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetch() -> [User] {
        let fetchRequest = User.fetchRequest()
        if let dataArray = try? viewContext.fetch(fetchRequest) {
            return dataArray
        } else {
            return [User]()
        }
    }
}