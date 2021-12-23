//
//  Event+CoreDataClass.swift
//  
//
//  Created by Sun on 23/12/2021.
//
//

import Foundation
import CoreData

@objc(Event)
public class Event: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }
    
    @NSManaged public var screenName: String
    @NSManaged public var timeInScreen: Int16
    @NSManaged public var pushInApp: Set<PushInApp>
}

extension Event {

    @objc(addPushInAppObject:)
    @NSManaged public func addToPushInApp(_ value: PushInApp)

    @objc(removePushInAppObject:)
    @NSManaged public func removeFromPushInApp(_ value: PushInApp)

    @objc(addPushInApp:)
    @NSManaged public func addToPushInApp(_ values: Set<PushInApp>)

    @objc(removePushInApp:)
    @NSManaged public func removeFromPushInApp(_ values: Set<PushInApp>)
}
