//
//  Exercise+CoreDataClass.swift
//  MotaCorData
//
//  Created by sam hastings on 02/05/2024.
//
//

import Foundation
import CoreData

enum DecoderConfigurationError: Error {
    case missingManagedObjectContext
}

extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

@objc(Exercise)
public class Exercise: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case id, name, force, level, mechanic, equipment, primaryMuscles, secondaryMuscles, instructions, category, images, singlesets
    }
    
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.force = try container.decode(String?.self, forKey: .force)
        self.level = try container.decode(String.self, forKey: .level)
        self.mechanic = try container.decode(String?.self, forKey: .mechanic)
        self.equipment = try container.decode(String?.self, forKey: .equipment)
        self.category = try container.decode(String.self, forKey: .category)
        self.instructions = try container.decode([String].self, forKey: .instructions)
        self.primaryMuscles = try container.decode([String].self, forKey: .primaryMuscles)
        self.secondaryMuscles = try container.decode([String].self, forKey: .secondaryMuscles)
        self.images = try container.decode([String].self, forKey: .images)
        self.singlesets = []//try container.decode(Set<Singleset>, forKey: .singlesets) as NSSet
        

    }
    
}


