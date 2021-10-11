//
//  quizRow.swift
//  Quiz_P1
//
//  Created by Andrés Alfaro Fernández on 22/9/21.
//

import SwiftUI

struct QuizRowView: View {
    var quizItem: QuizItem
    var body: some View {
        
        let a_url = quizItem.attachment?.url
        let a_nivm=NetworkImageViewModel(url:a_url)
        
        return
            HStack{
                NetworkImageView(viewModel:a_nivm)
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .shadow(color: Color.gray, radius: 5)
                VStack{
                        HStack(alignment: .center){
                            Text(quizItem.question)
                                .font(.headline)
                        }.scaledToFill()
                        HStack(alignment: .bottom){
                            VStack(alignment: .leading){
                                image_star
                            }
                            
                            VStack(alignment: .trailing){
                                editor
                            }
                        }
                    
                }
            }
            
    }
    
    private var image_star: some View{
        Image(quizItem.favourite ? "yellow_star" : "grey_star")
            .resizable()
            .frame(width: 20, height: 20)
            .scaledToFit()
            .shadow(color: Color.gray, radius: 5)
    }
    
    private var editor: some View{
        let u_url = quizItem.author?.photo?.url
        let u_nivm=NetworkImageViewModel(url:u_url)
        return
            HStack(alignment: .center, spacing: 5){
                Text(quizItem.author?.username ?? "Anónimo")
                    .font(.callout)
                
                NetworkImageView(viewModel:u_nivm)
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(lineWidth: 3))
        }
    }
}
/*
struct QuizRow_Previews: PreviewProvider {
    static var previews: some View {
        QuizRow()
    }
}*/
