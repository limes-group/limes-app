//
//  ContentView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Spacer()
                
                Text("Welcome to")
                    .font(.darkerGrotesqueBold(size: 36))
                    .foregroundStyle(.white)
                
                Image("Logo")
                    .resizable()
                    .frame(height: 120)
                    .foregroundStyle(.tint)
                Spacer()
                
                HStack {
                    
                    WhiteButton(buttonTitle: "Signup")  {
                        Task {
                            try? await Task.sleep(for: .seconds(0.1))
                            navigate(.signupView)
                        }
                    }
                    
                    AccentButton(buttonTitle: "Login", height: 60) {
                        Task {
                            try? await Task.sleep(for: .seconds(0.1))
                            navigate(.loginView)                                
                        }
                    }
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            .appBackground()
        }
    }
}

#Preview {
    @Previewable @State var routes:[Route] = []
    
    NavigationStack(path: $routes) {
        WelcomeView()
            .navigationDestination(for: Route.self) { route in
                route.destination
            }
    }
    .environment(\.navigate, NavigationAction(action: { route in
        routes.append(route)
    }))
}
