//
//  EventRepository.swift
//  CoreDataExample
//
//  Created by Sun on 23/12/2021.
//

import CoreData

final class EventRepository: BaseRepository {
    
    typealias T = Event
    
    internal var manager: DBManagerType!
    
    init(manager: DBManagerType) {
        self.manager = manager
    }
    
    func getList() -> [T] {
        let request = NSFetchRequest<T>(entityName: entityName)
        if let dataArray = try? manager.viewContext.fetch(request) {
            return dataArray
        } else {
            return [T]()
        }
    }
}
