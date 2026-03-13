//
//  BlackButton.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct BlackButton: View {
    let buttonTitle: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(buttonTitle)
                    .font(Font.system(.body, weight: .bold))
                    .font(.darkerGrotesqueBold(size: 24))
                    .foregroundStyle(.white )
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(.secondaryBunker)
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
    BlackButton(buttonTitle: "Request", action: {})
}
