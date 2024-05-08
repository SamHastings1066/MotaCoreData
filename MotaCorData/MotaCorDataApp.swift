//
//  MotaCorDataApp.swift
//  MotaCorData
//
//  Created by sam hastings on 24/04/2024.
//

import SwiftUI

@main
struct MotaCorDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
