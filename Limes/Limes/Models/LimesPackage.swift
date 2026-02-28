//
//  LimesPackage.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import Foundation

struct LimesPackage: Codable, Identifiable {
    var id = UUID()
    let title: String
    let price: Double
    let limesPackage: [LimesPackageDetails]
}

struct LimesPackageDetails: Codable, Identifiable {
    var id = UUID()
    let title: String
    let data: String
}
