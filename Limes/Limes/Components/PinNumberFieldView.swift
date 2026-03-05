//
//  PinNumberFieldView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import SwiftUI

struct PinNumberFieldView: View {
    var labelValue: String
    @Binding var pinNumber: String
    @State private var isSecure: Bool = false
    var titleKey: String

    var body: some View {
        VStack {
            Text(labelValue)
                .font(.manropeMedium(size: 14))
                .foregroundStyle(Color(.white))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 44)
                        .foregroundStyle(.white)
                        .cornerRadius(16)
                    
                    HStack (spacing: 16) {
                        if isSecure {
                            SecureField(titleKey, text: $pinNumber, prompt: Text(titleKey).foregroundStyle(.lightBunker))
                                .font(.manrope(size: 16))
                                .foregroundStyle(.white)
                                .padding(8)
                        } else {
                            TextField(titleKey, text: $pinNumber, prompt: Text(titleKey).foregroundStyle(.lightBunker))
                                .font(.manrope(size: 16))
                                .foregroundStyle(.white)
                                .padding(8)
                        }
                        
                        Button(action: { isSecure.toggle() }) {
                            Image(systemName: isSecure ? "lock.open.fill" : "lock.fill")
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
        }
        .frame(maxHeight: 90)
        .appBackground()
    }
}

#Preview {
    PinNumberFieldView(labelValue: "Pin", pinNumber: .constant(""), titleKey: "Create Pin")
}
