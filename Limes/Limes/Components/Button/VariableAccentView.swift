//
//  VariableAccentView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct VariableAccentView: View {
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
                    .font(.darkerGrotesqueBold(size: 24))
                    .foregroundStyle(.black )
                    .frame(maxWidth: width, maxHeight: height)
                    .background(.accent)
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
    VariableAccentView(buttonTitle: "Continue", width: 100, height: 48, action: {})
}
