//
//  Exercise+CoreDataProperties.swift
//  MotaCorData
//
//  Created by sam hastings on 02/05/2024.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var force: String?
    @NSManaged public var level: String
    @NSManaged public var mechanic: String?
    @NSManaged public var equipment: String?
    @NSManaged public var category: String
    @NSManaged public var instructions: [String]
    @NSManaged public var primaryMuscles: [String]
    @NSManaged public var secondaryMuscles: [String]
    @NSManaged public var images: [String]
    @NSManaged public var singlesets: NSSet?
    

}

// MARK: Generated accessors for singlesets
extension Exercise {

    @objc(addSinglesetsObject:)
    @NSManaged public func addToSinglesets(_ value: Singleset)

    @objc(removeSinglesetsObject:)
    @NSManaged public func removeFromSinglesets(_ value: Singleset)

    @objc(addSinglesets:)
    @NSManaged public func addToSinglesets(_ values: NSSet)

    @objc(removeSinglesets:)
    @NSManaged public func removeFromSinglesets(_ values: NSSet)

}

extension Exercise : Identifiable {

}
