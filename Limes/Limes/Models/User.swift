//
//  User.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let email: String
    let phoneNumber: String
    let fullName: String
    let photoURL: URL?
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
