//
//  Phone+CoreDataClass.swift
//  
//
//  Created by Sun on 13/12/2021.
//
//

import Foundation
import CoreData

@objc(Phone)
public class Phone: NSManagedObject {
    
    @NSManaged public var name: String?
    @NSManaged public var version: String?
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Phone> {
        return NSFetchRequest<Phone>(entityName: "Phone")
    }
}
