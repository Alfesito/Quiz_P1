//
//  ScoresModel.swift
//  Quiz_P1
//
//  Created by Andrés Alfaro Fernández on 30/9/21.
//

import Foundation

class ScoresModel: ObservableObject {
    
    @Published private(set) var acertadas: Set<Int> = []
    
    func check(res: String, quiz: QuizItem){
        let a1 = res.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let a2 = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(a1 == a2){
            acertadas.insert(quiz.id)
        }
    }
    
}
