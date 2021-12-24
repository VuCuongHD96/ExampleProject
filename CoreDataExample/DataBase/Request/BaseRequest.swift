//
//  BaseRequest.swift
//  CoreDataExample
//
//  Created by Sun on 23/12/2021.
//

import CoreData

protocol BaseRequestType {
    typealias T = NSManagedObject
    var request: NSFetchRequest<T> { get }
}

class BaseRequest: BaseRequestType {
    
    var request = NSFetchRequest<T>()
    
    init(className: T.Type) {
        makeRequest(className: className)
    }
}

extension BaseRequest {
    
    func makeRequest(className: T.Type) {
        let entityName = String(describing: className)
        request = NSFetchRequest<T>(entityName: entityName)
    }
}
