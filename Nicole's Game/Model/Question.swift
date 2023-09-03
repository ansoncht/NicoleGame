//
//  Question.swift
//  Nicole's Game
//
//  Created by Anson on 8/28/23.
//

import Foundation

struct Question: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var question: String
        var correctAnswer: String
    }
}
