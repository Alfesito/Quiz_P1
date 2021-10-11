//
//  ContentView.swift
//  Quiz_P1
//
//  Created by Andrés Alfaro Fernández on 22/9/21.
//

import SwiftUI

struct QuizzesListView: View {
    
    @EnvironmentObject var quizzesModel : QuizzesModel
    @EnvironmentObject var scoresModel : ScoresModel
    var body: some View {
        NavigationView{
            List{
                ForEach(quizzesModel.quizzes){
                    qi in
                    
                    NavigationLink(destination: QuizPlayView(quizItem:qi)){
                        QuizRowView(quizItem: qi)
                    }
                }
                //View para ipad
                //...
            }
            .padding()
            .navigationBarTitle(Text("Quiz P1 SwiftIU"))
            .onAppear(perform: {
                quizzesModel.load()
            })
        }
    }
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzesListView()
    }
}*/
