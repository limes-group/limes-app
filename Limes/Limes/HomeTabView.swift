//
//  TabView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct HomeTabView: View {
    @ObservedObject var userViewModel = ProfileViewModel.sharedInstance
    @State private var selectedTab = 0
    
    var body: some View {
        TabView {
            WalletHomeView()
                .tabItem { Label("Wallet", image: "Limes Tab Icon").foregroundStyle(.appBlack).background(.appBlack) }
                .tag(0)
            
            DepositView()
                .tabItem { Label("Shop", image: "Shop Tab Icon") }
                .tag(0)
            
            NotificationsTabView()
                .tabItem { Label("Notifications", image: "Bell Tab Icon") }
                .tag(0)
            
            ProfileView(profile: userViewModel.profile.user)
                .tabItem { Label("Profile", image: "Profile Tab Icon") }
                .tag(0)
        }
        .background(.appBlack)
    }
}

#Preview {
    HomeTabView()
        .preferredColorScheme(.dark)
}
