//
//  AccentButton.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/01.
//

import SwiftUI

struct AccentButton: View {
    let buttonTitle: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(buttonTitle)
                    .font(Font.system(.body, weight: .bold))
                    .font(.darkerGrotesque(size: 16))
                    .foregroundStyle(.black )
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(.accent)
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(16)
                    .lineLimit(nil)
            }
            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
        }
        .appBackground()
    }
}

#Preview {
    AccentButton(buttonTitle: "Continue", action: {})
}
