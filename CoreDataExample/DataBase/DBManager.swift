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
    func request(input: BaseRequest) -> [BaseRequest.T]
}

final class DBManager {
    
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
}

extension DBManager: DBManagerType {
    
    func request(input: BaseRequest) -> [BaseRequest.T] {
        let request = input.request
        if let dataArray = try? viewContext.fetch(request) {
            return dataArray
        } else {
            return [BaseRequest.T]()
        }
    }
}
