//
//  CoreDataManager.swift
//  MotaCorData
//
//  Created by sam hastings on 02/05/2024.
//

import Foundation
import CoreData

/// Manages the Core Data stack setup as well as operations on objects within the Core Data store.
class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext { persistentContainer.viewContext }
    
    let preloadedDataKey = "didPreloadData"
    
    static var preview: CoreDataManager = {
        let manager = CoreDataManager(inMemory: true)
        return manager
    }()
    
    private init(inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "Main")
        
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
            UserDefaults.standard.set(false, forKey: preloadedDataKey)
        }
        
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error {
                // TODO: remove fatalError before shipping to production.
                fatalError("Failed to load persistent stored: \(error.localizedDescription)")
            }
        }
        
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        

        preloadData(inMemory: inMemory)

        
    }

    
}

extension CoreDataManager {
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print(error)
                viewContext.rollback()
            }
        }
    }
}

extension CoreDataManager {
    func preloadData(inMemory: Bool) {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: preloadedDataKey) == false {
            let modelData = ModelData()
            Task {
                await modelData.loadData(inMemory: inMemory)
                save()
                print("Database saved")
            }
            userDefaults.set(true, forKey: preloadedDataKey)
        }
    }
}


