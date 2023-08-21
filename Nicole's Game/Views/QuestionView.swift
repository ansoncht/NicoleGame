//
//  QuestionView.swift
//  Nicole's Game
//
//  Created by Anson on 7/23/23.
//

import SwiftUI

struct QuestionView: View {
    @State private var answer: String = ""
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("正字刑警").lilacTitle()
                Spacer()
                Text("1 out of 10")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
                
            }
            ProgressBar(progress: 40)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("_____ hóng dēng 係咩啊？")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
            }
            
            PrimaryButton(text: "Next")
            
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
    }
}
