//
//  Quiz_P1App.swift
//  Quiz_P1
//
//  Created by Andrés Alfaro Fernández on 22/9/21.
//

import SwiftUI

@main
struct Quiz_P1App: App {
    let quizzesModel = QuizzesModel()
    let scoresModel = ScoresModel()
    
    var body: some Scene {
        WindowGroup {
            QuizzesListView()
                .environmentObject(quizzesModel)
                .environmentObject(scoresModel)
        }
    }
}
