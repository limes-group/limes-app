//
//  LoginView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.navigate) private var navigate
    @ObservedObject var viewModel = LoginViewModel()
    @ObservedObject var userViewModel = ProfileViewModel.sharedInstance
    
    @State private var showingCustomAlert = false
    var isSignInEnable: Bool {
        !viewModel.email.isEmpty && !viewModel.password.isEmpty
    }
    
    var body: some View {
        ZStack {
            VStack {
                Label("Login", image: "GreenDot")
                    .font(.manropeMedium(size: 16))
                    .foregroundStyle(.lightBunker)
                    .multilineTextAlignment(.center)
                
                Text("Welcome back!")
                    .font(.darkerGrotesqueBold(size: 48))
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 24, trailing: 0))
                
                Text("Email address")
                    .font(.manropeMedium(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Email address", text: $viewModel.email, prompt: Text("Enter email address"))
                    .font(Font.system(.body, weight: .regular))
                    .font(.manrope(size: 16))
                    .foregroundStyle(Color.white)
                    .keyboardType(.emailAddress)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    .background(.secondaryBunker)
                    .border(.darkBorder)
                    .cornerRadius(8)
                
                ToggleablePasswordField(password: $viewModel.password, titleKey: "Password", placeholder: "Enter password")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                
                Toggle(isOn: $viewModel.rememberMe) {
                    Text("Remember Me")
                        .font(.manrope(size: 14))
                        .foregroundStyle(.white)
                }
                Button(action: {
                    Task {
                        try? await Task.sleep(for: .seconds(0.1))
                        navigate(.forgotPasswordView)
                    }
                }) {
                    Text("Forgot your password?")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                
                AccentButtonView(buttonTitle: "Continue", width: .infinity, height: 48) {
                    Task {
                        viewModel.isPerforming = true
                        viewModel.isLoading = true
                        viewModel.loginUser()
                    }
                } onStatusChange: { isLoading in
                    viewModel.isPerforming = isLoading
                }
                .disabled(!isSignInEnable || viewModel.isPerforming)
//                .padding()
                //                TaskButtonView(buttonTitle: "Continue") {
                //                    isPerforming = true
                //                    viewModel.loginUser()
                //                } onStatusChange: { isLoading in
                //                    isPerforming = isLoading
                //                }
                //                .disabled(!isSignInEnable || isPerforming)
                //                .padding()
                
                LinkButton(buttonTitle: "Don't have an account?", linkText: "Sign up") {
                    Task {
                        try? await Task.sleep(for: .seconds(0.1))
                        navigate(.signupView)
                    }
                }
                
                Spacer()
            }
            .padding()
            .appBackground()
            .onChange(of: viewModel.signedIn) {
                if viewModel.signedIn {
                    Task {
                        try? await Task.sleep(for: .seconds(0.1))
                        navigate(.walletHomeTabView)
                    }
                }
            }
        }
        .allowsHitTesting(!viewModel.isPerforming)
        .opacity(!viewModel.isPerforming ? 1 : 0.7)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .fullScreenLoadingIndicator(isShowing: viewModel.isLoading)
        .overlay(alignment: .center) {
            // Custom alert overlay
            if let errorMessage = viewModel.errorMessage {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        // Optional: Dismiss alert by tapping background
                        showingCustomAlert = false
                    }
                
                CustomAlertView(
                    title: "Limes",
                    message: errorMessage, isOkayOnly: true,
                    isPresented: $showingCustomAlert,
                    confirmAction: {
                        viewModel.errorMessage = nil
                    }
                )
                .transition(.scale) // Optional: Add a transition effect
            }
        }
    }
    
}

#Preview {
    @Previewable @State var routes:[Route] = []
    
    NavigationStack(path: $routes) {
        LoginView()
            .navigationDestination(for: Route.self) { route in
                route.destination
            }
    }
    .environment(\.navigate, NavigationAction(action: { route in
        routes.append(route)
    }))
}
