//
//  TransfarView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct TransfarView: View {
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [.accentColor ,.blue],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                VStack {
                    Text("Transfar View")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                }
            }
        }
    }
}

#Preview {
    TransfarView()
}
