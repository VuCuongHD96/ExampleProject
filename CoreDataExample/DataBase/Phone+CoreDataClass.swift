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
    
    convenience init(name: String, version: String) {
        self.init(context: DBManager.shared.viewContext)
        self.name = name
        self.version = version
    }
}
