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
        QuestionView()
            .environmentObject(gameManager)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameManager())
    }
}
