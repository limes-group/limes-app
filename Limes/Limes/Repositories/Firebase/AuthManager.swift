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

class AuthManager: ObservableObject {
    @Published var user: User?
    @Published var userSession: String?
    
    static let limesURL: URL = URL(string: "https://limes-staging.up.railway.app/api/auth/token")!
    let limesUserURL: URL = URL(string: "https://limes-staging.up.railway.app/api/user")!
    
    let authManager: AuthManager?
    
    init(user: User? = nil, authManager: AuthManager? = nil) {
        self.user = user
        self.authManager = authManager
    }
    
    func loginUser() async throws -> User {
        guard let url = URL(string: "https://limes-staging.up.railway.app/api/auth/token") else {
            throw LimesAPIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw LimesAPIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try JSONDecoder().decode(User.self, from: data)
        } catch {
            throw LimesAPIError.invalidData
        }
    }
    
    func signInWith(email: String, andPassword password: String) {
        print("Email: \(email)")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                print("Firebase Error: \(String(describing: error.localizedDescription))")
            } else {
                print("we are logged in: \n \(String(describing: result))")
            }
        }
    }
    
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
