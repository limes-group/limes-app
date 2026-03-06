//
//  NavigationAction.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/06.
//

import Foundation

struct NavigationAction {
    typealias Action = (Route) -> ()
    let action: Action
    
    func callAsFunction(_ route: Route) {
        action(route)
    }
}
