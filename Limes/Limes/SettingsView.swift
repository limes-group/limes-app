//
//  SettingsView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            VStack {
                ProfileHeaderView()
                Spacer()
            }
            .appBackground()
        }
    }
}

#Preview {
    SettingsView()
}
