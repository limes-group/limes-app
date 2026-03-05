//
//  CheckoutListItem.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import Foundation

struct CheckoutListItem: Codable, Identifiable {
    var id = UUID()
    var itemCount: Int
    var itemTitle: String
    var itemPrice: Double
}
