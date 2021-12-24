//
//  PhoneRepository.swift
//  CoreDataExample
//
//  Created by Sun on 15/12/2021.
//

import Foundation

protocol PhoneRepositoryType {
    func getList(by user: User) -> [Phone]
}

final class PhoneRepository {
    
    typealias T = Phone
    
    internal var manager: DBManagerType!
    
    init(manager: DBManagerType) {
        self.manager = manager
    }
    
    func savePhone(user: User, phone: Phone) {
        user.addToPhone(phone)
        manager.save()
    }
}

extension PhoneRepository: BaseRepository {
    
    func getList() -> [T] {
        let phoneRequest = PhoneRequest()
        if let dataArray = manager.request(input: phoneRequest) as? [T] {
            return dataArray
        } else {
            return [T]()
        }
    }
}

extension PhoneRepository: PhoneRepositoryType {
    
    func getList(by user: User) -> [Phone] {
        return Array(user.phone)
    }
}
