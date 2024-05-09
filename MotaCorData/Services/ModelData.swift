//
//  ModelData.swift
//  MotaCorData
//
//  Created by sam hastings on 03/05/2024.
//

import Foundation
import CoreData

@Observable
final class ModelData {
    
    func loadData(viewContext: NSManagedObjectContext) {
        guard let url = Bundle.main.url(forResource: "exercises", withExtension: "json") else {
            fatalError("Failed to find exercises.json")
        }
        
        let decoder = JSONDecoder()
        let viewContext = viewContext
        
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = viewContext
        
        do {
            let data = try Data(contentsOf: url)
            _ = try? decoder.decode([Exercise].self, from: data)
            try viewContext.save()
            print("Database saved")
        } catch {
            print("Invalid data")
        }
    }
    
}
