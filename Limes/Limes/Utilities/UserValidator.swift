//
//  UserValidator.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import Foundation

@Observable class UserValidator {
    var name = ""
    var email = ""
    var password = ""
    
    var isLoginDisabled: Bool {
        return !name.isEmpty && !email.isEmpty && password.count < 8
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
