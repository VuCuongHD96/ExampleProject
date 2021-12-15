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
    @NSManaged public var phone: Set<Phone>

    public class func fetchAllUser() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    public class func fetchRequest(by name: String) -> NSFetchRequest<User> {
        let arrayUser = fetchAllUser()
        let predicate = NSPredicate(format: "name == %@ ", name)
        arrayUser.predicate = predicate
        return arrayUser
    }
    
    @objc(addPhoneObject:)
    @NSManaged public func addToPhone(_ value: Phone)

    @objc(removePhoneObject:)
    @NSManaged public func removeFromPhone(_ value: Phone)

    @objc(addPhone:)
    @NSManaged public func addToPhone(_ values: Set<Phone>)

    @objc(removePhone:)
    @NSManaged public func removeFromPhone(_ values: Set<Phone>)
}
