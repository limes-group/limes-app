//
//  ContentView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WelcomeViewModel()
    @State private var isLoginActive = false
    @State private var isRegisterActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .purple],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    Spacer()
                    
                    Text("Welcome to")
                        .bold()
                        .font(.largeTitle)
                    Spacer()
                    
                    Image("Logo")
                        .resizable()
                        .frame(height: 120)
                        .foregroundStyle(.tint)
                    Spacer()
                    
                    Button {
                        isLoginActive = true
                    } label: {
                        Label("Login", systemImage: "lock.fill")
                            .bold()
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(.white)
                            .buttonStyle(.borderedProminent)
                            
                            .cornerRadius(16)
                    }
                    .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                    .navigationDestination(isPresented: $isLoginActive) {
                        AuthView(isLoginMode: true)
                            .navigationBarBackButtonHidden(true)
                    }
                    
                    Button {
                        isRegisterActive = true
                    } label: {
                        Label("Signup", systemImage: "person.crop.circle.badge.plus")
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(.blue)
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(16)
//                            .shadow(color: Color.black.opacity(0.6), radius: 5, x: 2, y: 5)
                    }
                    .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                    .navigationDestination(isPresented: $isRegisterActive) {
                        AuthView(isLoginMode: false)
                            .navigationBarBackButtonHidden(true)
                    }
                    Spacer()
                }
                .padding()
            }
            
            
        }
    }
}

#Preview {
    ContentView(viewModel: WelcomeViewModel())
}
