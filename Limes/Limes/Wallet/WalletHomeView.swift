//
//  WalletHomeView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct WalletHomeView: View {    
    @ObservedObject var userViewModel = ProfileViewModel.sharedInstance
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        Text("Hi, \(String(userViewModel.profile.user.fullName))")
                            .font(.darkerGrotesqueBold(size: 24))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Welcome to your Wallet")
                            .font(.manrope(size: 15))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                        
                        WalletBalanceView(
                            availableBalance: $userViewModel.profile.availableBalance,
                            cashBack: $userViewModel.profile.cashback)
                        
                        WalletActionsView()
                        
                        WalletRecentTransactionsView(transactions: userViewModel.profile.transactions)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            .appBackground()
        }
        .onAppear() {
            userViewModel.loadProfile()
        }
    }
    
    struct WalletActionsView: View {
        var body: some View {
            HStack {
                NavigationLink {
                    
                } label: {
                    Label("SIM", image: "SIMIcon")
                        .font(.manropeMedium(size: 12))
                        .foregroundStyle(Color(Color.white))
                        .labelStyle(VerticalLabelStyle())
                        .frame(width: 60, height: 60)
                }
                .padding()
                
                NavigationLink {
                    
                } label: {
                    Label("Shop", image: "ShopIcon")
                        .font(.manropeMedium(size: 12))
                        .foregroundStyle(Color(Color.white))
                        .labelStyle(VerticalLabelStyle())
                        .frame(width: 60, height: 60)
                }
                .padding()
                
                NavigationLink {
                    
                } label: {
                    Label("Transact", image: "TransactIcon")
                        .font(.manropeMedium(size: 12))
                        .foregroundStyle(Color(Color.white))
                        .labelStyle(VerticalLabelStyle())
                        .frame(width: 60, height: 60)
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    WalletHomeView()
}
