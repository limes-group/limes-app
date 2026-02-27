//
//  WelcomeViewModel.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import Foundation
import Combine
import FirebaseAuth

class WelcomeViewModel: ObservableObject {
    @Published var message: String = "Hello, World!"
    @Published var currentUserId: String = ""
    var handler: AuthStateDidChangeListenerHandle? = nil
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        Auth.auth().currentUser != nil
    }
}
