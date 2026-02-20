//
//  PaymentView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [.accentColor, .green],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                VStack {
                    Text("Payment View")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                }
            }
        }
    }
}

#Preview {
    PaymentView()
}
