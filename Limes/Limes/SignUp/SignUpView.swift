//
//  SignUp.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel = SignUpViewModel()
//    @Binding var isValidPassword: Bool = false
    var isValidPassword: Bool = false
    let validatePassword: (String) -> Bool = { _ in return false }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Label("Sign up", image: "GreenDot")
                        .font(.manrope(size: 16))
                        .foregroundStyle(.lightBunker)
                        .multilineTextAlignment(.center)
                    
                    Text("Let's get started")
                        .font(.darkerGrotesqueBold(size: 48))
                        .foregroundStyle(.white)
                    
                    Text("Join the Lines community")
                        .font(.manropeMedium(size: 15))
                        .foregroundStyle(.lightBunker)
                        .padding(EdgeInsets(top: 4, leading: 0, bottom: 24, trailing: 0))
                    
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
                    
                    Text("Password")
                        .font(.manropeMedium(size: 14))
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ToggleablePasswordField(password: $viewModel.password, titleKey: "Password")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(!isValidPassword ? .red : .white)
                        )
                    
                    Text("Confirm password")
                        .font(.manropeMedium(size: 14))
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ToggleablePasswordField(password: $viewModel.confirmPassword, titleKey: "Confirm Password")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(!isValidPassword ? .red : .white)
                        )
                    
                    Toggle(isOn: $viewModel.hasAgreed) {
                        Text("I agree to the [Terms and Conditions](https://www.apple.com)")
                            .font(Font.system(.body, weight: .medium))
                            .font(.manrope(size: 14))
                            .foregroundStyle(.white)
                    }
                    
                    AccentButton(buttonTitle: "Continue") {
                        Task {
                            
                        }
                    }
                    
                    LinkButton(buttonTitle: "Already have an account?", linkText: "Login now") {
                        Task {
                            
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

#Preview {
    SignUpView()
}
