//
//  User+CoreDataClass.swift
//  
//
//  Created by Sun on 10/12/2021.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    @NSManaged public var name: String
    @NSManaged public var age: String

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
}
