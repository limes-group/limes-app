//
//  ProfileViewModel.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    static let sharedInstance = ProfileViewModel()
    
    let dateFormatter = DateFormatter()
    
    @Published var profile = Profile(
        user: User(id: "user", email: "balleng2@gmail.com", phoneNumber: "0677739828", fullName: "Balleng Testerson", photoURL: nil),
        availableBalance: 10000,
        cashback: 325,
        wallet: [],
        transactions: []
    )
    
    private init() { }
    
    func loadProfile() {
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let transactions = [
            Transaction(name: "Groceries", amount: 2250, date: dateFormatter.date(from: "2024-01-01T14:35:15+02:00")!, icon: "Basket", cardType: CardType.cardtype_visa.displayName, cashBack: 0),
            Transaction(name: "Data top up", amount: 0, date: dateFormatter.date(from: "2025-03-03T14:35:15+02:00")!, icon: "Basket", cardType: CardType.cardtype_masterCardc.displayName, cashBack: 2),
            Transaction(name: "Deposit", amount: 9000, date: dateFormatter.date(from: "2025-05-05T14:35:15+02:00")!, icon: "Basket", cardType: CardType.other.displayName, cashBack: 0),
            Transaction(name: "Deposit", amount: 1000, date: dateFormatter.date(from: "2025-07-07T14:35:15+02:00")!, icon: "Basket", cardType: CardType.other.displayName, cashBack: 0),
            Transaction(name: "Groceries", amount: 2250, date: dateFormatter.date(from: "2026-01-09T14:35:15+02:00")!, icon: "Basket", cardType: CardType.cardtype_visa.displayName, cashBack: 0),
            Transaction(name: "Toiletries", amount: 5000, date: dateFormatter.date(from: "2026-02-11T14:35:15+02:00")!, icon: "Basket", cardType: CardType.cardtype_masterCardc.displayName, cashBack: 0),
            Transaction(name: "Deposit", amount: 2400, date: dateFormatter.date(from: "2026-03-13T14:35:15+02:00")!, icon: "Basket", cardType: CardType.other.displayName, cashBack: 0),
        ]
        self.profile.transactions = transactions
    }
}
