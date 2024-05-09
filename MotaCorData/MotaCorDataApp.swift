//
//  MotaCorDataApp.swift
//  MotaCorData
//
//  Created by sam hastings on 24/04/2024.
//

import SwiftUI

@main
struct MotaCorDataApp: App {
    private var modelData = ModelData()
    @State private var isDataLoaded = UserDefaults.standard.bool(forKey: "didPreloadData")
    let viewContext = CoreDataManager.shared.viewContext
    
    init() {
        if !isDataLoaded { loadData() }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, viewContext)
        }
    }
    
    private func loadData() {
        modelData.loadData(viewContext: viewContext)
        CoreDataManager.shared.save()
        UserDefaults.standard.set(true, forKey: "didPreloadData")
        isDataLoaded = true
    }
}
