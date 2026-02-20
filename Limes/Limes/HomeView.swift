//
//  HomeView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0 // Use 0, 1, etc., or an enum
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [.accentColor],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                VStack {
                    Text("Home View")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
