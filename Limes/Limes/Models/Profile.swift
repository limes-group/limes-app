//
//  Profile.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import Foundation

struct Profile: Codable {
    var user: User
    var availableBalance: Double
    var cashback: Double
    var wallet: [Wallet]
    var transactions: [Transaction]
}

struct Wallet: Codable {
    var balance: String
}
