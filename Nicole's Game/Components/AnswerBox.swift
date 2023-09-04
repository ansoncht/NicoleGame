//
//  AnswerBox.swift
//  Nicole's Game
//
//  Created by Anson on 9/3/23.
//

import SwiftUI

struct AnswerBox: View {
    @Binding var answer: String
    
    var body: some View {
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
}

struct AnswerBox_Previews: PreviewProvider {
    static var previews: some View {
        AnswerBox(answer: .constant(""))
    }
}
