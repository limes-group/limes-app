//
//  LimesApp.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

@main
struct LimesApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                    .environmentObject(AuthManager())
            }
        }
    }
}
