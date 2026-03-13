//
//  LoginViewModel.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import Combine
import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {
    private let auth = Auth.auth()
    
    @Published var signedIn: Bool = false
    @Published var user: User?
    @Published var countryCode = "+27"
    @Published var email = "" // "balleng2@gmail.com"
    @Published var password = "" // "PassWord@1"
    @Published var isPasswordSecure = true
    @Published var rememberMe = false
    @Published var isLoading: Bool = false
    @Published var isLoginActive = true
    @Published var isAuthenticated = false
    @Published var isPerforming: Bool = false
    @Published var errorMessage: String?
    
    private var userValidator = UserValidator()
    
    var authManager = AuthManager()
    
    init() {}
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func loginUser() {
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard authResult != nil, error == nil else {
                DispatchQueue.main.async {
                    self?.isPerforming = false
                    self?.isLoading = false
                    self?.errorMessage = error?.localizedDescription
                }
                return
            }
            
            DispatchQueue.main.async {
                self?.isPerforming = false
                self?.isLoading = false
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
            DispatchQueue.main.async { [weak self] in
                self?.signedIn = false
            }
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError)")
        }
    }
}
