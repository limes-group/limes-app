//
//  WalletBalanceView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct WalletBalanceView: View {
    @Binding var availableBalance: Double
    @Binding var cashBack: Double
    @State private var isSecure: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 160)
                .foregroundStyle(.secondaryBunker)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.lightBunker, lineWidth: 2)
                )
            VStack {
                Text("Available balance")
                    .font(.darkerGrotesqueBold(size: 18))
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                
                HStack {
                    if isSecure {
                        Text("**********")
                            .font(.darkerGrotesqueBold(size: 36))
                            .foregroundStyle(.accent)
                    } else {
                        Text(availableBalance, format: .currency(code: "ZAR"))
                            .font(.darkerGrotesqueBold(size: 36))
                            .foregroundStyle(.accent)
                    }
                    Button(action: { isSecure.toggle() }) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                            .foregroundColor(.lightBunker)
                    }
                    .padding()
                }
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                
                HStack {
                    Text("Available balance")
                        .font(.darkerGrotesqueBold(size: 18))
                        .foregroundStyle(.white)
                    Text(cashBack, format: .currency(code: "ZAR"))
                        .font(.darkerGrotesqueBold(size: 18))
                        .foregroundStyle(.accent)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        }
    }
}

#Preview {
    WalletBalanceView(availableBalance: .constant(10000), cashBack: .constant(324))
}
