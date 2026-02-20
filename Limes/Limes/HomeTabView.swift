//
//  TabView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct HomeTabView: View {
    @State private var selectedTab = 0 // Use 0, 1, etc., or an enum
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .purple],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            TabView {
                HomeView()
                    .tabItem { Label("Home", systemImage: "house") }
                    .tag(0) // Unique tag for programmatic selection
                
                PaymentView()
                    .tabItem { Label("Payment", systemImage: "creditcard.fill") }
                    .tag(0) // Unique tag for programmatic selection
                TransfarView()
                    .tabItem { Label("Transfar", systemImage: "arrow.left.arrow.right.circle") }
                    .tag(0) // Unique tag for programmatic selection
                SettingsView()
                    .tabItem { Label("Settings", systemImage: "gear") }
                    .tag(1)
            }
        }
    }
}

#Preview {
    HomeTabView()
}
