//
//  InputAmountView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import SwiftUI

struct InputAmountView: View {
    var labelValue: String
    var placeholder: String
    @Binding var inputAmount: String
    
    var body: some View {
        VStack {
            Text(labelValue)
                .font(.manropeMedium(size: 14))
                .foregroundStyle(Color(.white))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Input Amount", text: $inputAmount, prompt: Text(placeholder).foregroundStyle(.lightBunker))
                .font(Font.system(.body, weight: .regular))
                .font(.manrope(size: 16))
                .foregroundStyle(Color.white)
                .keyboardType(.emailAddress)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                .background(.secondaryBunker)
                .border(.darkBorder)
                .cornerRadius(8)
                .shadow(radius: 1)
        }
        .frame(maxHeight: 90)
        .appBackground()
    }
}

#Preview {
    InputAmountView(labelValue: "Input amount:", placeholder: "Enter amount", inputAmount: .constant(""))
}
