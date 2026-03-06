//
//  Extension+View.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/06.
//

import SwiftUI

extension View {
    func fullScreenLoadingIndicator(isShowing: Bool) -> some View {
        self.modifier(LoadingIndicatorView(isShowing: isShowing))
    }
}
