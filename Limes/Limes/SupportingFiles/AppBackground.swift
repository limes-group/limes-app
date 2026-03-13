//
//  AppBackground.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct AppBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Color.appBlack
                    .ignoresSafeArea()
            )
    }
}

extension View {
    func appBackground() -> some View {
        self.modifier(AppBackground())
    }
}
