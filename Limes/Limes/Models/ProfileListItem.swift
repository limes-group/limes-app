//
//  ProfileListItem.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import Foundation

struct ProfileListItem: Identifiable {
    let id = UUID() //
    let title: String
    let badge: Int?
    let icon: String
}
