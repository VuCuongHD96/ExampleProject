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
public class User: NSManagedObject, Decodable {
    
    @NSManaged public var name: String
    @NSManaged public var age: String
    @NSManaged public var phone: Set<Phone>
    
    convenience init(name: String, age: String) {
        self.init(context: DBManager.shared.viewContext)
        self.name = name
        self.age = age
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case phones
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init(context: DBManager.shared.viewContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        age = try values.decode(String.self, forKey: .age)
        phone = try values.decode(Set<Phone>.self, forKey: .phones)
    }
}

extension User {
    
    @objc(addPhoneObject:)
    @NSManaged public func addToPhone(_ value: Phone)
    
    @objc(removePhoneObject:)
    @NSManaged public func removeFromPhone(_ value: Phone)
    
    @objc(addPhone:)
    @NSManaged public func addToPhone(_ values: Set<Phone>)
    
    @objc(removePhone:)
    @NSManaged public func removeFromPhone(_ values: Set<Phone>)
}
