//
//  LoginViewModel.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var user: User?
    @Published var countryCode = "+27"
    @Published var phoneNumber = "balleng2@gmail.com"
    @Published var password = "PassWord@1"
    @Published var isPasswordSecure = true
    @Published var rememberMe = false
    @Published var isLoginActive = true
    
    var authManager = AuthManager()
    
    init() {}
    
    func loginUser() async throws -> User {
        do {
            return try await authManager.loginUser()
        } catch {
            throw LimesAPIError.invalidData
        }
    }
    
//    func loginWithNumberAndPassword() {
//        authManager.signInWith(email: phoneNumber, andPassword: password)
//    }
}
