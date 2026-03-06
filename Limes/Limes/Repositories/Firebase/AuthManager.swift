//
//  AuthManager.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

enum LimesAPIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct AuthResponse: Codable {
    let accessToken: String
    let refreshToken: String
    // Other user details like id, username, etc.
    let id: Int
    let username: String
    // ...
}

struct FirebaseAuthResponse: Codable {
    let kind: String
    let localId: String
    let email: String
    let displayName: String
    let idToken: String
    let registered: Bool
    let refreshToken: String
    let expiresIn: String
}

class AuthManager: ObservableObject {
    @Published var user: FirebaseAuth.User?
    @Published var errorMessage: String?
    
    static let Firebase_Api_Key: String = "AIzaSyB9LL0oyWEZXzkWA9x9_zv-t6WS0sQGjDc"
    static let limesURL: URL = URL(string: "https://limes-staging.up.railway.app/api/auth/token")!
    let limesUserURL: URL = URL(string: "https://limes-staging.up.railway.app/api/user")!
    
    //    let authManager: AuthManager?
    
    //    init(user: User? = nil, authManager: AuthManager? = nil) {
    //        self.user = user
    //        self.authManager = authManager
    //    }
    
    init() {
        let _ = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            self?.user = user
            self?.errorMessage = nil
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    self?.user = nil
                } else {
                    // Sign-in successful, the state listener will update the user property
                    print("Login success")
                    self?.errorMessage = nil
                }
            }
        }
    }
//        func loginUser(credentials: LoginRequest) async throws -> AuthResponse {
//            guard let url = URL(string: "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key={{\(AuthManager.Firebase_Api_Key)}}") else {
//                throw LimesAPIError.invalidURL
//            }
//    
//            print("API: \(url)")
//    
//            var request = URLRequest(url: url)
//                    request.httpMethod = "POST"
//                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//                    request.httpBody = try JSONEncoder().encode(credentials)
//    
//            let (data, response) = try await URLSession.shared.data(from: url)
//    
//            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//                print("Error: \(URLError(.badServerResponse).localizedDescription)")
//                throw URLError(.badServerResponse)
//            }
//    
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                return try JSONDecoder().decode(AuthResponse.self, from: data)
//            } catch {
//                throw LimesAPIError.invalidData
//            }
//        }
    //
    //    func signInWith(email: String, andPassword password: String) async throws -> FirebaseAuthResponse {
    //
    //        do {
    //            try Auth.auth().signIn(withEmail: email, password: password) { result, error in
    //                if let error {
    //                    print("Firebase Error: \(String(describing: error.localizedDescription))")
    //                } else {
    //                    print("we are logged in: \n \(String(describing: result!.user))")
    //                    let decoder = JSONDecoder()
    //                    decoder.keyDecodingStrategy = .convertFromSnakeCase
    //                    return try JSONDecoder().decode(FirebaseAuthResponse.self, from: result?.user)
    //                }
    //            }
    //        }
    //    }
    
    func createUser(withEmail email: String, phoneNumber: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else { return }
            
            self.insertUserRecord(id: userId, phoneNumber: phoneNumber, email: email, password: password)
        }
    }
    
    func insertUserRecord(id userId: String, phoneNumber: String, email: String, password: String) {
        let newUser = User(id: userId, email: email, phoneNumber: phoneNumber, fullName: "User Tester", photoURL: nil)
        
        let database = Firestore.firestore()
        
        database.collection("users")
            .document(userId)
            .setData(newUser.asDictionary())
    }
    
    func signOut() {
        
    }
    
    func listenToAuthState() {
        
    }
}

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
