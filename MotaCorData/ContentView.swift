//
//  ContentView.swift
//  MotaCorData
//
//  Created by sam hastings on 24/04/2024.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) private var exercises: FetchedResults<Exercise>
    
    init() {     
        

                let sampleExerciseIds = [
                    "Barbell_Squat",
                    "Barbell_Deadlift",
                    "Barbell_Bench_Press_-_Medium_Grip",
                    "Seated_Cable_Rows"
                ]
        _exercises = FetchRequest(
            sortDescriptors: [],
            predicate: NSPredicate(format: "Any id IN %@", sampleExerciseIds)
        )
        print("Content View initialised")
    }
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
    let modelData = ModelData()
    let viewContext = CoreDataManager.preview.viewContext
    modelData.loadData(viewContext: viewContext) 
    
    return ContentView()
        .environment(\.managedObjectContext, viewContext)
    
}
