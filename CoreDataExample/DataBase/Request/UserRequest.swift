//
//  UserRequest.swift
//  CoreDataExample
//
//  Created by Sun on 23/12/2021.
//

import Foundation

class UserRequest: BaseRequest {
        
    init() {
        super.init(className: User.self)
    }
    
    init(format: String) {
        super.init(className: User.self, format: format)
    }
}
