//
//  WelcomeViewModel.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import Foundation
import Combine

class WelcomeViewModel: ObservableObject {
    @Published var message: String = "Hello, World!"
    
    init() {}
}
