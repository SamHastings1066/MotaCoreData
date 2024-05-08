//
//  ContentView.swift
//  MotaCorData
//
//  Created by sam hastings on 24/04/2024.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) private var exercises: FetchedResults<Exercise>
    
    var body: some View {
        List {
            ForEach(exercises) {exercise in
                VStack {
                    Text(exercise.name)
                    Text(exercise.force ?? "None")
                    Text(exercise.level)
                    Text(exercise.mechanic ?? "None")
                    Text(exercise.equipment ?? "None")
                    Text(exercise.category)
                    ForEach(exercise.primaryMuscles, id: \.self) { primaryMuscle in
                        Text(primaryMuscle)
                    }
                    ForEach(exercise.secondaryMuscles, id: \.self) { secondaryMuscle in
                        Text(secondaryMuscle)
                    }
                    ForEach(exercise.images, id: \.self) { image in
                        Text(image)
                    }
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    return ContentView()
        .environment(\.managedObjectContext, CoreDataManager.preview.viewContext)
}
