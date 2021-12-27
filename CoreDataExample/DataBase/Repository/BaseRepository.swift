//
//  BaseRepository.swift
//  CoreDataExample
//
//  Created by Sun on 15/12/2021.
//

import Foundation

protocol BaseRepository {
    
    associatedtype T
    var manager: DBManagerType! { get }
    init(manager: DBManagerType)
    func getList() -> [T] 
}

extension BaseRepository {
    
    var entityName: String {
        return String(describing: T.self)
    }
    
    func getArrayData(input: BaseRequest) -> [T] {
        if let dataArray = manager.request(input: input) as? [T] {
            return dataArray
        } else {
            return [T]()
        }
    }
}
