//
//  VerticalLabelStyle.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

public struct VerticalLabelStyle: LabelStyle {
    public let spacing: CGFloat // Optional spacing parameter

    public init(spacing: CGFloat = 8) {
        self.spacing = spacing
    }

    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: spacing) {
            configuration.icon
            configuration.title
        }
    }
}
