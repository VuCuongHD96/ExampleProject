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
    var predicate: NSPredicate?
    
    init(className: T.Type) {
        makeRequest(className: className, format: nil)
    }
    
    init(className: T.Type, format: String) {
        makeRequest(className: className, format: format)
    }
}

extension BaseRequest {
    
    func makeRequest(className: T.Type, format: String?) {
        let entityName = String(describing: className)
        request = NSFetchRequest<T>(entityName: entityName)
        if let format = format {
            let predicate = NSPredicate(format: format)
            request.predicate = predicate
        }
    }
}
