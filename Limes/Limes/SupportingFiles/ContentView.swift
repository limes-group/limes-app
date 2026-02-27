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
                VStack(spacing: 16) {
                    Spacer()
                    
                    Text("Welcome to")
                        .bold()
                        .font(.darkerGrotesque(size: 36))
                        .foregroundStyle(.white)
                    
                    Image("Logo")
                        .resizable()
                        .frame(height: 120)
                        .foregroundStyle(.tint)
                    Spacer()
                    
                    HStack {
                        Button {
                            isRegisterActive = true
                        } label: {
                            Text("Signup")
                                .font(.darkerGrotesque(size: 24))
                                .foregroundStyle(.black )
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .background(.white)
                                .buttonStyle(.borderedProminent)
                                .cornerRadius(16)
                        }
                        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                        .navigationDestination(isPresented: $isRegisterActive) {
                            AuthView(isLoginMode: false)
                                .navigationBarBackButtonHidden(true)
                        }
                        
                        Button {
                            isLoginActive = true
                        } label: {
                            Text("Login")
                                .font(.darkerGrotesque(size: 24))
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .background(.accent)
                                .buttonStyle(.borderedProminent)
                                
                                .cornerRadius(16)
                        }
                        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                        .navigationDestination(isPresented: $isLoginActive) {
                            AuthView(isLoginMode: true)
                                .navigationBarBackButtonHidden(true)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            .appBackground()
        }
    }
}

extension Font {
    static func manrope(size: CGFloat, relativeTo style: Font.TextStyle = .body) -> Font {
        return .custom("Manrope-Regular", size: size, relativeTo: style)
    }
    
    static func darkerGrotesque(size: CGFloat, relativeTo style: Font.TextStyle = .body) -> Font {
        return .custom("Darker-Grotesque-Regular", size: size, relativeTo: style)
    }
}

#Preview {
    ContentView(viewModel: WelcomeViewModel())
}
