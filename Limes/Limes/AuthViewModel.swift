//
//  AuthViewModel.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI
import LocalAuthentication
import Combine

class AuthViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @Published var isLoginMode = true
    @Published var errorMessage = ""
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var rememberMe = false
    
    init() {
        loadRememberedUser()
    }
    
    // MARK: - Validation
    
    var isValidEmail: Bool {
        let emailRegex =
        #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex)
            .evaluate(with: email)
    }
    
    var isValidPassword: Bool {
        password.count >= 6
    }
    
    var isFormValid: Bool {
        if isLoginMode {
            return isValidEmail && isValidPassword
        } else {
            return isValidEmail &&
                   isValidPassword &&
                   password == confirmPassword
        }
    }
    
    // MARK: - Auth
    
    func authenticate() {
        errorMessage = ""
        guard isFormValid else {
            errorMessage = "Please enter valid information."
            return
        }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false
            
            if self.isLoginMode {
                self.login()
            } else {
                self.register()
            }
        }
    }
    
    private func login() {
        // Replace with real backend
        if email == "test@test.com" && password == "123456" {
            completeAuthentication()
        } else {
            errorMessage = "Invalid credentials"
        }
    }
    
    private func register() {
        completeAuthentication()
    }
    
    private func completeAuthentication() {
        if rememberMe {
            UserDefaults.standard.set(email, forKey: "rememberedUser")
        }
        isAuthenticated = true
    }
    
    private func loadRememberedUser() {
        if let savedEmail = UserDefaults.standard.string(forKey: "rememberedUser") {
            email = savedEmail
            rememberMe = true
        }
    }
    
    // MARK: - Biometrics
    
    func loginWithBiometrics() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: "Login with Face ID") { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                    }
                }
            }
        }
    }
}
