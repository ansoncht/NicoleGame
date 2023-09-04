//
//  GameManager.swift
//  Nicole's Game
//
//  Created by Anson on 9/2/23.
//

import Foundation
import SwiftUI

class GameManager: ObservableObject {
    private (set) var question: [Question.Result] = []
    @Published private (set) var length = 0
    @Published private (set) var index = 0
    @Published private (set) var reachedEnd = false
    @Published private (set) var currentQuestion = ""
    @Published private (set) var currentAnswer = ""
    @Published private (set) var progress: CGFloat = 0.00
    @Published private (set) var score = 0


    init () {
        Task.init {
            await fetchQuestion()
        }
    }
    
    func fetchQuestion() async {
        guard let path = Bundle.main.path(forResource: "Questions", ofType: "json") else {
            fatalError("Error reading JSON file path")
        }
        do {
            guard let data = try String(contentsOfFile: path).data(using: .utf8) else {
                fatalError("Error reading JSON file")
                
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(Question.self, from: data)
            print(result)

            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                
                self.question = result.results
                self.length = self.question.count
                self.setQuestion()
            }
        } catch {
            fatalError("Error fetching questions")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)
        print(progress)
        
        if index < length {
            let currentWorkingQuestion = question[index]
            currentQuestion = currentWorkingQuestion.question
            currentAnswer = currentWorkingQuestion.correctAnswer
        }
    }
    
    func checkAnswer(answer: String) {
        print(answer)
        print(currentAnswer)
        if answer == currentAnswer {
            score += 1
        }
    }
}
