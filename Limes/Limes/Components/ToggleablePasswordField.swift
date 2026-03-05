//
//  ToggleablePasswordField.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct ToggleablePasswordField: View {
    @Binding var password: String
    @State private var isSecure: Bool = true
    var titleKey: String
    var placeholder: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 68)
                .foregroundStyle(.black)
                .cornerRadius(16)
            
            VStack {
                Text(titleKey)
                    .font(.manropeMedium(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack (spacing: 16) {
                    if isSecure {
                        SecureField(titleKey, text: $password, prompt: Text(placeholder).foregroundStyle(.lightBunker))
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 16))
                            .foregroundStyle(.white)
                            .padding(8)
                    } else {
                        TextField(titleKey, text: $password, prompt: Text(placeholder)
                            .foregroundStyle(.lightBunker))
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 16))
                            .foregroundStyle(.white)
                            .padding(8)
                    }
                    
                    Button(action: { isSecure.toggle() }) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                            .foregroundColor(.lightBunker)
                    }
                    .padding(8)
                }
                .frame(maxWidth: .infinity, maxHeight: 44)
                .background(Color.secondaryBunker)
                .border(Color.darkBorder, width: 1)
                .cornerRadius(8)
                .animation(.easeInOut(duration: 0.2), value: isSecure)
            }
        }
        .appBackground()
    }
}


#Preview {
    ToggleablePasswordField(password: .constant(""), titleKey: "Password", placeholder: "Enter password")
}
