//
//  QuestionView.swift
//  Nicole's Game
//
//  Created by Anson on 7/23/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var answer: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("正字刑警").lilacTitle()
                Spacer()
                Text("\(gameManager.index + 1) out of \(gameManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
                
            }
            ProgressBar(progress: gameManager.progress)
            
            VStack(alignment: .center, spacing: 20) {
                Text(gameManager.currentQuestion)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                    .padding(10)
                AnswerBox(answer: $answer)
            }
            
            Button {
                gameManager.checkAnswer(answer: answer)
                answer = ""
                gameManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: answer.isEmpty ? Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327) : Color("AccentColor"))
            }
            .disabled(answer.isEmpty)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarBackButtonHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(GameManager())
    }
}
