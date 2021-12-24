//
//  UserRepository.swift
//  CoreDataExample
//
//  Created by Sun on 15/12/2021.
//

import Foundation

protocol UserRepositoryType {
    func save(_ user: User)
}

final class UserRepository {
    
    typealias T = User
    
    internal var manager: DBManagerType!
    
    init(manager: DBManagerType) {
        self.manager = manager
    }
}

extension UserRepository: BaseRepository {
    
    func getList() -> [T] {
        let userRequest = UserRequest()
        return getArrayData(input: userRequest)
    }
}

extension UserRepository: UserRepositoryType {
    
    func save(_ user: User) {
        manager.save()
    }
    
    func getUser(name: String) -> [T] {
        let userRequest = UserRequest(format: "name = '\(name)'")
        return getArrayData(input: userRequest)
    }
    
    
    //    public class func fetchRequest(by name: String) -> NSFetchRequest<User> {
    //        let arrayUser = fetchAllUser()
    //        let predicate = NSPredicate(format: "name == %@ ", name)
    //        arrayUser.predicate = predicate
    //        return arrayUser
    //    }
}
