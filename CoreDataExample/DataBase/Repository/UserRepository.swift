//
//  UserRepository.swift
//  CoreDataExample
//
//  Created by Sun on 15/12/2021.
//

import Foundation
 
final class UserRepository: BaseRepository {
    
    typealias T = User
    
    private var manager: DBManagerType!
    
    init(manager: DBManagerType) {
        self.manager = manager
    }
    
    func getListUser() -> [T] {
        return manager.fetchListItem(item: T.self)
    }
    
    func saveUser(name: String, age: String) {
        let user = User(context: manager.viewContext)
        user.name = name
        user.age = age
        manager.save()
    }
}
