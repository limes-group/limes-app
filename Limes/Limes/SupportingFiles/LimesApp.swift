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
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State var routes:[Route] = []
    @State var userValidator = UserValidator()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        let viewModel = LoginViewModel()
        WindowGroup {
            NavigationStack(path: $routes) {
                WelcomeView()
                    .environmentObject(viewModel)
                    .environmentObject(ProfileViewModel.sharedInstance)
                    .navigationDestination(for: Route.self) { route in
                        route.destination
                    }
                    
                    .environmentObject(AuthManager())
            }
            .environment(\.navigate, NavigationAction(action: { route in
                routes.append(route)
            }))
        }
    }
}
