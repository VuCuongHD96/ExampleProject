//
//  UserRequest.swift
//  CoreDataExample
//
//  Created by Sun on 23/12/2021.
//

import CoreData

class UserRequest: BaseRequest {

//    typealias T = User
        
    init() {
        super.init(className: User.self)
    }
}
