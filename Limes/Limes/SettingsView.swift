//
//  SettingsView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [.accentColor, .cyan],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                VStack {
                    Text("Settings View")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
