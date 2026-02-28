//
//  Statement.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import Foundation
import Combine

struct Statement: Codable, Identifiable {
    var id: Int
    var title: String
    var amount: Double
    var date: String
}
