//
//  AuthenticationManager.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import Foundation
import AuthenticationServices
import CryptoKit
import FirebaseAuth

struct UserInfo: Codable {
    let uid: String
    let email: String?
    let displayName: String?
    let photoURl: String?
    
    init(user: FirebaseAuth.User) {
        self.uid = user.uid
        self.email = user.email
        self.displayName = user.displayName
        self.photoURl = user.photoURL?.absoluteString
    }
}

class AuthenticationManager {
    static var shared = AuthenticationManager()
    private let auth = Auth.auth()
    
    private init() {}
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func getLoggedInUser() async throws -> UserInfo? {
        guard let user = auth.currentUser else {
            return nil
        }
        return UserInfo(user: user)
    }
    
    func createUserAccount(email: String, password: String, name: String) async throws -> UserInfo {
        let result = try await auth.createUser(withEmail: email, password: password)
        let changeResult = result.user.createProfileChangeRequest()
        changeResult.displayName = name
        try await changeResult.commitChanges()
        return UserInfo(user: result.user)
    }
    
    func loginUser(email: String, password: String) async throws -> UserInfo {
        let result = try await auth.signIn(withEmail: email, password: password)
        return UserInfo(user: result.user)
    }
    
    func sendPasswordReset(email: String) async throws {
        try await auth.sendPasswordReset(withEmail: email)
    }
    
    func signOut() throws {
        try auth.signOut()
    }
}

extension AuthenticationManager {
    func signIn(credential: AuthCredential) async throws -> UserInfo {
        let authResult = try await auth.signIn(with: credential)
        return UserInfo(user: authResult.user)
    }
}
