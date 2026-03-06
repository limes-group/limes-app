//
//  LoadingIndicatorView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/06.
//

import SwiftUI

struct LoadingIndicatorView: ViewModifier {
    var isShowing: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isShowing)
                .blur(radius: isShowing ? 2 : 0)

            if isShowing {
                Color.gray.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(x: 2, y: 2)
                    .padding(24)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(16)
                    .shadow(radius: 10)
            }
        }
    }
}
