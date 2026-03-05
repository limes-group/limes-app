//
//  AccentButtonView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct AccentButtonView: View {
    let buttonTitle: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text(buttonTitle)
                    .font(.darkerGrotesqueBold(size: 16))
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
    AccentButtonView(buttonTitle: "Continue", width: .infinity, height: 48)
}
