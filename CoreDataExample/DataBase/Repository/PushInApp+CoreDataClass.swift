//
//  PushInApp+CoreDataClass.swift
//  
//
//  Created by Sun on 23/12/2021.
//
//

import Foundation
import CoreData

@objc(PushInApp)
public class PushInApp: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PushInApp> {
        return NSFetchRequest<PushInApp>(entityName: "PushInApp")
    }

    @NSManaged public var title: String
    @NSManaged public var body: String
}
