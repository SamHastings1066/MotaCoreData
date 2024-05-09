//
//  WorkoutListScreen.swift
//  MotaCorData
//
//  Created by sam hastings on 09/05/2024.
//

import SwiftUI

struct WorkoutListScreen: View {
    
    @FetchRequest(
        sortDescriptors: []
        //,
        //predicate: NSPredicate(format: "Any id IN %@", [
//            "Barbell_Squat",
//            "Barbell_Deadlift",
//            "Barbell_Bench_Press_-_Medium_Grip",
//            "Seated_Cable_Rows"
//        ])
    ) private var sampleExercises: FetchedResults<Exercise>
    
    var body: some View {
        Text("Joker")
            .onAppear {
                print(sampleExercises.count)
            }
    }
}

#Preview {
    WorkoutListScreen()
        .environment(\.managedObjectContext, CoreDataManager.preview.viewContext)
}
