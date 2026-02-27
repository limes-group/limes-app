//
//  LimesApp.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

@main
struct LimesApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                // 1. Place your background (Color, Image, or Gradient) first in the ZStack
//                Color.black
//                    .ignoresSafeArea() // Extends the background to the screen edges
                
                // 2. Place your main content view second
                HomeTabView()
            }
        }
    }
}
