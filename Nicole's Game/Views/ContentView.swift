//
//  ContentView.swift
//  Nicole's Game
//
//  Created by Anson on 7/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing:20) {
                    Text("正字刑警")
                        .lilacTitle()
                    Text("Hi 周小姐 睇吓你幾時捨得寫翻啱啲字🤭")
                        .foregroundColor(Color("AccentColor"))
                    Text("啱八成就有獎啦！")
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    GameView()
                        .environmentObject(gameManager)
                } label: {
                    PrimaryButton(text: "快啲㩒啦")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
