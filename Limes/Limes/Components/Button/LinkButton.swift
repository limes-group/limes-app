//
//  LinkButton.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/01.
//

import SwiftUI

struct LinkButton: View {
    let buttonTitle: String
    let linkText: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text("\(buttonTitle) \(Text(linkText).underline().foregroundStyle(.accent))")
                    .font(Font.system(.body, weight: .medium))
                    .font(.manrope(size: 14))
                    .foregroundStyle(.white)
                    .lineLimit(nil)
            }
            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
        }
        .appBackground()
    }
}

#Preview {
    LinkButton(buttonTitle: "Terms and conditions", linkText: "Log in now", action: {})
}
