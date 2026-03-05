//
//  VariableBlackButton.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct VariableBlackButton: View {
    let buttonTitle: String
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(buttonTitle)
                    .font(Font.system(.body, weight: .bold))
                    .font(.darkerGrotesque(size: 14))
                    .foregroundStyle(.white )
                    .frame(width: width, height: height)
                    .background(.secondaryBunker)
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(16)
                    .lineLimit(nil)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            }
        }
        .appBackground()
    }
}

#Preview {
    VariableBlackButton(buttonTitle: "Continue", width: 100, height: 48, action: {})
}
