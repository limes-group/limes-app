//
//  Transaction.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import Foundation

struct Transaction: Codable, Identifiable {
    var id = UUID()
    var name: String
    var amount: Double
    var date: Date
    var icon: String
    var cardType: String
    var cashBack: Double
}
