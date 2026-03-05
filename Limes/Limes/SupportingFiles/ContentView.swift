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
    @State var userValidator = UserValidator()
    @State private var path = NavigationPath()
    
    var body: some View {
        if !viewModel.isSignedIn, viewModel.currentUserId.isEmpty {
            NavigationStack(path: $path) {
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
                                path.append("SignupViewValue")
                            }
                            
                            AccentButton(buttonTitle: "Login") {
                                path.append("LoginViewValue")
                            }
                            
//                            NavigationLink(destination: {
//                                LoginView(userValidator: userValidator)
//                                    .navigationBarBackButtonHidden(true)
//                            }, label: {
//                                Text("Login")
//                                    .font(.darkerGrotesque(size: 24))
//                                    .foregroundStyle(.black)
//                                    .frame(maxWidth: .infinity, maxHeight: 40)
//                                    .background(.accent)
//                                    .buttonStyle(.borderedProminent)
//                                
//                                    .cornerRadius(16)
//                            })
                        }
                        Spacer()
                    }
                    .padding()
                    .navigationDestination(for: String.self) { screen in
                        if screen == "LoginViewValue" {
                            LoginView(userValidator: userValidator)
                        }
                    }
                }
                .appBackground()
            }
        } else {
            LoginView(userValidator: userValidator)
        }
    }
}

#Preview {
    ContentView(viewModel: WelcomeViewModel())
}
