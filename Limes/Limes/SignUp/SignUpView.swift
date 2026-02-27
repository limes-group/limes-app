//
//  SignUp.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var phoneNumber: String = ""
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordSecure: Bool = true
    @State private var isConfirmSecure: Bool = true
    @State private var hasAgreed = false
    @State private var isRegisterActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Label("Sign up", image: "GreenDot")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                    
                    Text("Let's get started")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    Text("Join the Lines community")
                        .font(.body)
                        .foregroundStyle(.gray)
                        .padding(EdgeInsets(top: 4, leading: 0, bottom: 24, trailing: 0))
                    
                    Text("Phone number")
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Email address", text: .constant("Hello"))
                        .foregroundStyle(Color(.white))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(.secondaryBunker)
                    
                    Text("Email address")
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Email address", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Password")
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ToggleablePasswordField(password: $password, titleKey: "Password")
                    
                    Text("Confirm password")
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ToggleablePasswordField(password: $confirmPassword, titleKey: "Confirm Password")
                    
                    Toggle(isOn: $hasAgreed) {
                        Text("I agree to the [Terms and Conditions](https://www.apple.com)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                    
                    Button {
                        isRegisterActive = true
                    } label: {
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black )
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(.accent)
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(16)
                    }
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                    .navigationDestination(isPresented: $isRegisterActive) {
                        AuthView(isLoginMode: false)
                            .navigationBarBackButtonHidden(true)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("Already have an account? \(Text("Login in now").underline().foregroundStyle(.accent))")
                            .foregroundStyle(.white)
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
