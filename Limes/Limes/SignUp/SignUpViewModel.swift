//
//  SignUpViewModel.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import Foundation
import Combine
import FirebaseAuth

struct SignUpRequest: Codable {
    var externalId = UUID().uuidString
    let emailAddress: String
    let firstName: String
    let lastName: String
//    let password: String
//    let phoneNumber: String
}

struct SignUpAuthResponse: Codable {
    let id: String
    let externalId: String
    let emailAddress: String
    let displayName: String
    let msisdns: [String]
    let ricaComplete: Bool
}

class SignUpViewModel: ObservableObject {
    @Published var countryCode = "+27"
    @Published var phoneNumber: String = "0671234567"
    @Published var emailAddress: String = "pafemop615@him6.com" // "user4@testing.com"
    @Published var password: String = "PassWord@1"
    @Published var confirmPassword: String = "PassWord@1"
    @Published var isPasswordSecure: Bool = true
    @Published var isConfirmSecure: Bool = true
    @Published var hasAgreed = false
    @Published var isRegisterActive = false
    @Published var signUp: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    private let auth = Auth.auth()
    private let Firebase_Api_Key: String = "AIzaSyB9LL0oyWEZXzkWA9x9_zv-t6WS0sQGjDc"
    
    init() {}
    
    func createUser() {
        auth.createUser(withEmail: emailAddress, password: password) { [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                DispatchQueue.main.async {
                    let errorText: String  = error?.localizedDescription ?? "unknown error"
                    self?.errorMessage = errorText
                }
                return
            }
            
            self?.auth.currentUser?.sendEmailVerification { (error) in
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                  return
                }
                
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.signUp = true
                }
                
            }
            
//            DispatchQueue.main.async {
//                print("Auth Result: \(String(describing: authResult))")
//                self?.isLoading = false
//                self?.signUp = true
//            }
        }
    }
    
    func createUser(credentials: SignUpRequest) async throws -> SignUpAuthResponse {
        guard let url = URL(string: "https://limes-staging.up.railway.app/api/user") else {
            throw LimesAPIError.invalidURL
        }

        print("API: \(url)")

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(Firebase_Api_Key)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(credentials)

        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Error: \(URLError(.badServerResponse).localizedDescription)")
            throw URLError(.badServerResponse)
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try JSONDecoder().decode(SignUpAuthResponse.self, from: data)
        } catch {
            throw LimesAPIError.invalidData
        }
    }
    
//    func loginUser() {
//        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
//            guard authResult != nil, error == nil else {
//                DispatchQueue.main.async {
//                    self?.isPerforming = false
//                    self?.errorMessage = error?.localizedDescription
//                }
//                return
//            }
//            
//            DispatchQueue.main.async {
//                self?.isPerforming = false
//                self?.isLoading = false
//                self?.signedIn = true
//            }
//        }
//    }
    
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
