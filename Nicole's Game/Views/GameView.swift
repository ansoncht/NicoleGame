//
//  GameView.swift
//  Nicole's Game
//
//  Created by Anson on 8/16/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        if gameManager.reachedEnd {
            VStack(spacing: 20) {
                Text("正字刑警")
                    .lilacTitle()
                Text("睇吓自己有幾多分啦你🤭")
                Text("0")
                    .bold()
                    .font(.system(size: 80))
                Text("實際都有 \(gameManager.score) / \(gameManager.length) 嘅😗")
                    .bold()
                    .font(.system(size: 3))
                Button {
                    Task.init {
                        await gameManager.fetchQuestion()
                    }
                } label: {
                    PrimaryButton(text: "再接再厲？")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        } else {
            QuestionView()
                .environmentObject(gameManager)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameManager())
    }
}
