//
//  LoginView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @Bindable var userValidator: UserValidator
    @State var errorMessage: String?
    @State private var showingCustomAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Label("Login", image: "GreenDot")
                        .font(Font.system(.body, weight: .medium))
                        .font(.manrope(size: 16))
                        .foregroundStyle(.lightBunker)
                        .multilineTextAlignment(.center)
                    
                    Text("Welcome back!")
                        .bold()
                        .font(.darkerGrotesque(size: 48))
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: 4, leading: 0, bottom: 24, trailing: 0))
                    
                    Text("Phone number")
                        .font(Font.system(.body, weight: .medium))
                        .font(.manrope(size: 14))
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
                        TextField("Phone Number", text: $viewModel.phoneNumber, prompt: Text("Enter phone number").foregroundStyle(.lightBunker))
                            .keyboardType(.phonePad)
                            .foregroundStyle(.white)
                            .background(.secondaryBunker)
                            .onChange(of: viewModel.phoneNumber) { oldValue, newValue in
                                viewModel.phoneNumber = Utilities().formatPhoneNumber(newValue)
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(.secondaryBunker)
                    .border(.darkBorder)
                    .cornerRadius(8)
                    .shadow(radius: 1)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    Text("Password")
                        .font(Font.system(.body, weight: .medium))
                        .font(.manrope(size: 14))
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ToggleablePasswordField(password: $viewModel.password, titleKey: "Password")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    Toggle(isOn: $viewModel.rememberMe) {
                        Text("Remember Me")
                            .font(.custom("Manrope-Regular", size: 14, relativeTo: .body))
                            .foregroundStyle(.white)
                    }
                    Button(action: {
                        
                    }) {
                        Text("Forgot your password?")
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    Button {
                        Task {
                            await loginUser()
                        }
                    } label: {
                        Text("Continue")
                            .font(Font.system(.body, weight: .bold))
                            .font(.darkerGrotesque(size: 16))
                            .foregroundStyle(.black )
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .background(.accent)
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(16)
                    }
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                    .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                    .disabled(userValidator.isLoginDisabled)
                    
                    Button(action: {
                        
                    }) {
                        Text("Don't have an account? \(Text("Sign up").underline().foregroundStyle(.accent))")
                            .foregroundStyle(.white)
                    }
                    Spacer()
                }
                .padding()
            }
            .appBackground()
        }
        .overlay(alignment: .center) {
            // Custom alert overlay
            if showingCustomAlert {
                Color.black.opacity(0.4) // Semi-transparent background
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        // Optional: Dismiss alert by tapping background
                        showingCustomAlert = false
                    }
                
                CustomAlertView(
                    title: "Limes",
                    message: errorMessage ?? "Error", isOkayOnly: true,
                    isPresented: $showingCustomAlert,
                    confirmAction: {
                        // Put your confirmation logic here
                        print("Action confirmed!")
                    }
                )
                .transition(.scale) // Optional: Add a transition effect
            }
        }
    }
    
    func loginUser() async {
        do {
            viewModel.user = try await viewModel.loginUser()
        } catch LimesAPIError.invalidData {
            errorMessage = "Invalid data"
            showingCustomAlert = true
        } catch LimesAPIError.invalidURL {
            errorMessage = "Invalid URL"
            showingCustomAlert = true
        } catch LimesAPIError.invalidResponse {
            errorMessage = "Invalid Response"
            showingCustomAlert = true
        } catch {
            errorMessage = "Something went wrong, please try again"
            showingCustomAlert = true
        }
    }
}

#Preview {
    @Previewable @State var userValidator = UserValidator()
    
    LoginView (userValidator: userValidator)
}
