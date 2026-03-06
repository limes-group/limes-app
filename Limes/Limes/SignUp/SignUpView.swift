//
//  SignUp.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.navigate) private var navigate
    @ObservedObject var viewModel = SignUpViewModel()
    var isValidPassword: Bool = false
    let validatePassword: (String) -> Bool = { _ in return false }
    @State private var showingCustomAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                Label("Sign up", image: "GreenDot")
                    .font(.manrope(size: 16))
                    .foregroundStyle(.lightBunker)
                    .multilineTextAlignment(.center)
                
                Text("Let's get started")
                    .font(.darkerGrotesqueBold(size: 48))
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                
                Text("Join the Lines community")
                    .font(.manropeMedium(size: 15))
                    .foregroundStyle(.lightBunker)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 8, trailing: 0))
                
                Text("Phone number")
                    .font(.manropeMedium(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    // Country Code / Picker
                    Text(viewModel.countryCode)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .cornerRadius(8)
                    
                    Rectangle()
                        .frame(maxWidth: 1, maxHeight: 44)
                        .foregroundStyle(Color(.darkBorder))
                    
                    // Phone Number Field
                    TextField("Phone Number", text: $viewModel.phoneNumber, prompt: Text("Enter phone number")
                        .foregroundStyle(.lightBunker))
                        .font(.manrope(size: 16))
                        .keyboardType(.phonePad)
                        .foregroundStyle(Color.white)
                        .background(.secondaryBunker)
                }
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(.secondaryBunker)
                .border(.darkBorder)
                .cornerRadius(8)
                .shadow(radius: 1)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                
                Text("Email address")
                    .font(.manropeMedium(size: 14))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Email address", text: $viewModel.emailAddress, prompt: Text("Enter email address").foregroundStyle(.lightBunker))
                    .font(Font.system(.body, weight: .regular))
                    .font(.manrope(size: 16))
                    .foregroundStyle(Color.white)
                    .keyboardType(.emailAddress)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    .background(.secondaryBunker)
                    .border(.darkBorder)
                    .cornerRadius(8)
                    .shadow(radius: 1)
                
                ToggleablePasswordField(password: $viewModel.password, titleKey: "Password", placeholder: "Enter password")
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                
                ToggleablePasswordField(password: $viewModel.confirmPassword, titleKey: "Confirm Password", placeholder: "Enter password")
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                
                Toggle(isOn: $viewModel.hasAgreed) {
                    Text("I agree to the [Terms and Conditions](https://www.apple.com)")
                        .font(Font.system(.body, weight: .medium))
                        .font(.manrope(size: 14))
                        .foregroundStyle(.white)
                }
                
                AccentButton(buttonTitle: "Continue", height: 60) {
//                    Task {
//                        try? await Task.sleep(for: .seconds(0.5))
//                        viewModel.isLoading = true
//                        await signUpUser()
//                    }
                    Task {
                        try? await Task.sleep(for: .seconds(0.5))
                        viewModel.isLoading = true
                        viewModel.createUser()
                    }
                }
//                .disabled(viewModel.validateEmail(viewModel.emailAddress) == false || viewModel.validateEmail(viewModel.emailAddress) == false || viewModel.password.isEmpty || viewModel.confirmPassword.isEmpty || !viewModel.hasAgreed)
                
                LinkButton(buttonTitle: "Already have an account?", linkText: "Login now") {
                    Task {
                        try? await Task.sleep(for: .seconds(0.5))
                        navigate(.loginView)
                    }
                }
                
                Spacer()
            }
            .padding()
            .appBackground()
            .onChange(of: viewModel.signUp) {
                if viewModel.signUp {
                    Task {
                        try? await Task.sleep(for: .seconds(0.5))
                        navigate(.verifyUserView)
                    }
                }
            }
        }
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
    
    func signUpUser() async {
        do {
            let response = try await viewModel.createUser(
                credentials: SignUpRequest(emailAddress: viewModel.emailAddress, firstName: "User", lastName: "Testerson")
            )
            print("Signup Response: \(response)")
        } catch let error {
            print("Signup Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    @Previewable @State var routes:[Route] = []
    
    NavigationStack(path: $routes) {
        SignUpView()
            .navigationDestination(for: Route.self) { route in
                route.destination
            }
    }
    .environment(\.navigate, NavigationAction(action: { route in
        routes.append(route)
    }))
}
