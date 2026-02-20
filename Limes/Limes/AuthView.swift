//
//  AuthView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var viewModel = AuthViewModel()
    @State var isLoginMode: Bool = true
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .purple],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text(isLoginMode ? "Welcome Back" : "Create Account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .animation(.easeInOut, value: isLoginMode)
                
                VStack(spacing: 15) {
                    
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    if !isLoginMode {
                        SecureField("Confirm Password", text: $viewModel.confirmPassword)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .transition(.opacity)
                    }
                    
                    Toggle("Remember Me", isOn: $viewModel.rememberMe)
                        .foregroundColor(.white)
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.yellow)
                            .font(.footnote)
                    }
                    
                    Button(action: {
                        viewModel.authenticate()
                    }) {
                        if viewModel.isLoading {
                            ProgressView()
                                .tint(.white)
                        } else {
                            Text(viewModel.isLoginMode ? "Login" : "Register")
                                .bold()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.isFormValid ? Color.black : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .disabled(!viewModel.isFormValid || viewModel.isLoading)
                    
                    if isLoginMode {
                        Button("Login with Face ID") {
                            viewModel.loginWithBiometrics()
                        }
                        .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        withAnimation {
                            isLoginMode.toggle()
                        }
                    }) {
                        Text(isLoginMode ?
                             "Don't have an account? Register" :
                             "Already have an account? Login")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding()
            }
        }
    }
}


#Preview {
    AuthView()
}
