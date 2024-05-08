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
    
    func loadData(inMemory: Bool) async {
        guard let url = Bundle.main.url(forResource: "exercises", withExtension: "json") else {
            fatalError("Failed to find exercises.json")
        }
        
        let decoder = JSONDecoder()
        
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = inMemory ? CoreDataManager.preview.viewContext : CoreDataManager.shared.viewContext
        
        do {
            let data = try Data(contentsOf: url)
            _ = try? decoder.decode([Exercise].self, from: data)
        } catch {
            print("Invalid data")
        }
        
    }
    
}
