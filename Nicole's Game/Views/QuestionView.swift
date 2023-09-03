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
            ProgressBar(progress: 40)
            
            VStack(alignment: .center, spacing: 20) {
                Text(gameManager.currentQuestion)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                    .padding(10)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)

                    TextField("你嘅答案係？", text: $answer)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 80)
                .padding(.top, 10)
            }
            
            Button {
                gameManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: gameManager.answerTyped ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!gameManager.answerTyped)
            
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
