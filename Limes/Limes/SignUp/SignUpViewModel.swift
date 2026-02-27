//
//  SignUpViewModel.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var countryCode = "+27"
    @Published var phoneNumber: String = "0671234567"
    @Published var emailAddress: String = "user1@testing.com"
    @Published var password: String = "PassWord@1"
    @Published var confirmPassword: String = "PassWord@1"
    @Published var isPasswordSecure: Bool = true
    @Published var isConfirmSecure: Bool = true
    @Published var hasAgreed = false
    @Published var isRegisterActive = false
    
    var authManager = AuthManager()
    
    func createUser() {
        authManager.createUser(withEmail: emailAddress, phoneNumber: phoneNumber, password: password)
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}
