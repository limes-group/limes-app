//
//  User.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var email: String
    var phoneNumber: String
    var fullName: String
    var photoURL: URL?
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
