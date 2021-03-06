//
//  QuizPlayView.swift
//  Quiz_P1
//
//  Created by Andrés Alfaro Fernández on 30/9/21.
//

import SwiftUI

struct QuizPlayView: View {
    @EnvironmentObject var scoresModel : ScoresModel
    var quizItem: QuizItem
    @State var answer: String = ""
    @State var showAlert = false
    
    var body: some View {
        
        return
            VStack{
                HStack{
                    Text(quizItem.question)
                        .font(.largeTitle)
                    Image(quizItem.favourite ? "yellow_star" : "grey_star")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        .shadow(color: Color.gray, radius: 5)
                    
                }
                    TextField("Respuesta",
                              text: $answer,
                              onCommit: {
                                showAlert = true
                                scoresModel.check(res: answer, quiz: quizItem)
                    }
                    )
                        .alert(isPresented: $showAlert){
                            let s1: String = answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                            let s2: String = quizItem.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                            
                            return Alert(title: Text("Resultado"),
                                         message: Text(s1 == s2 ? "Bien" : "Mal"),
                                         dismissButton: .default(Text("Ok"))
                            )
                        }.padding()
                
                Button(action: {
                    showAlert = true
                    scoresModel.check(res: answer, quiz: quizItem)
                }) {
                    Text("Comprobar")
                }
                
                attachment
                    .padding()
                
                HStack(alignment: .bottom, spacing: 100){
                    HStack(alignment: .firstTextBaseline, spacing: 10){
                        scores
                            .padding()
                    }
                    HStack(alignment: .lastTextBaseline, spacing: 10){
                        author
                            .padding()
                    }
                }
        }
    }
    
    private var scores: some View{
        Text("\(scoresModel.acertadas.count)")
            .font(.title)
            .fontWeight(.bold)
    }
    
    private var author: some View{
        let u_url = quizItem.author?.photo?.url
        let u_nivm=NetworkImageViewModel(url:u_url)
        
        return HStack(alignment: .center, spacing: 5){
                Text(quizItem.author?.username ?? "Anónimo")
                    .font(.callout)
                
                NetworkImageView(viewModel:u_nivm)
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(lineWidth: 3))
                    
        }
    }
    
    private var attachment: some View{
        let a_url = quizItem.attachment?.url
        let a_nivm=NetworkImageViewModel(url:a_url)
        
        return GeometryReader(content: {geometry in
        NetworkImageView(viewModel:a_nivm)
            .scaledToFill()
            .frame( width: geometry.size.width,
                    height: geometry.size.height)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .contentShape(RoundedRectangle(cornerRadius: 20))
            .clipShape(Rectangle())
            .shadow(color: Color.gray, radius: 5)
            //Animations
            .saturation(self.showAlert ? 0.1 : 1)
            .animation(.easeInOut, value: self.showAlert)
            
        })
    }
}
/*
struct QuizPlayView_Previews: PreviewProvider {
    static var previews: some View {
        QuizPlayView()
    }
}*/
