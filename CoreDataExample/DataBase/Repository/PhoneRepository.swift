//
//  PhoneRepository.swift
//  CoreDataExample
//
//  Created by Sun on 15/12/2021.
//

import Foundation

final class PhoneRepository: BaseRepository {
    
    func getList() -> [Phone] {
        return manager.fetchListItem(item: T.self)
    }
    
    typealias T = Phone
    
    internal var manager: DBManagerType!
    
    init(manager: DBManagerType) {
        self.manager = manager
    }
    
    func getListPhone() -> [T] {
        return manager.fetchListItem(item: T.self)
    }
    
    func savePhone(user: User, name: String, version: String) {
        let phone = Phone(context: manager.viewContext)
        phone.name = name
        phone.version = version
        user.addToPhone(phone)
        manager.save()
    }
}
