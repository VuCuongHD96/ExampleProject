//
//  UserRepository.swift
//  CoreDataExample
//
//  Created by Sun on 15/12/2021.
//

import Foundation
 
final class UserRepository {
  
    typealias T = User
    
    internal var manager: DBManagerType!
    
    init(manager: DBManagerType) {
        self.manager = manager
    }
    
    func saveUser(name: String, age: String) {
        let user = User(context: manager.viewContext)
        user.name = name
        user.age = age
        manager.save()
    }
}

extension UserRepository: BaseRepository {

    func getList() -> [T] {
        let userRequest = UserRequest()
        if let dataArray = manager.request(input: userRequest) as? [T] {
            return dataArray
        } else {
            return [T]()
        }
    }
}
