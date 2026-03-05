//
//  TabView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct HomeTabView: View {
    @ObservedObject var userViewModel = ProfileViewModel.sharedInstance
    @State private var selectedTab = 0 // Use 0, 1, etc., or an enum
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .purple],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            TabView {
                WalletHomeView()
                    .tabItem { Label("Wallet", image: "Limes Tab Icon") }
                    .tag(0)
                
                DepositView()
                    .tabItem { Label("Shop", image: "Shop Tab Icon") }
                    .tag(0)
                
                ProfileView(profile: userViewModel.profile.user)
                    .tabItem { Label("Profile", image: "Profile Tab Icon") }
                    .tag(0)
                
//                SettingsView()
//                    .tabItem { Label("Settings", systemImage: "gear") }
//                    .tag(1)
            }
        }
    }
}

#Preview {
    HomeTabView()
}
