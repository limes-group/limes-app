//
//  WalletRecentTransactionsView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct WalletRecentTransactionsView: View {
    var transactions: [Transaction]
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent transactions")
                    .font(.darkerGrotesqueBold(size: 24))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                Text("See all")
                    .font(.manrope(size: 15))
                    .foregroundStyle(.lightBunker)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: 100, alignment: .trailing)
                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
            }
            
            ForEach(transactions) { transaction in
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 65)
                            .background(Color.secondaryBunker)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                        
                        HStack(alignment: .center) {
                            Image("\(transaction.icon)")
                                .resizable()
                                .frame(width: 32, height: 32)
                            
                            VStack {
                                Text(String(describing: transaction.name))
                                    .font(.darkerGrotesqueBold(size: 20))
                                    .foregroundStyle(Color(.white))
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(String(describing: transaction.date))
                                    .font(.manropeMedium(size: 12))
                                    .foregroundStyle(.lightBunker)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            VStack {
                                if (transaction.cashBack == 0) {
                                    Text(String(describing: transaction.amount))
                                        .font(.manrope(size: 15))
                                        .foregroundStyle(transaction.amount > 0 ? .accent : .illusion)
                                        .multilineTextAlignment(.trailing)
                                        .frame(maxWidth: 100, alignment: .center)
                                        .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                                } else {
                                    ZStack{
                                        Rectangle()
                                            .foregroundStyle(.secondaryBunker)
                                            .frame(width: 100, height: 24)
                                            .cornerRadius(12)
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                        Text("cashback")
                                            .font(Font.manropeMedium(size: 14))
                                            .foregroundStyle(.yellow)
                                    }
                                    .padding(0)
                                    Text(transaction.cashBack, format: .currency(code: "ZAR"))
                                        .font(.manropeBold(size: 15))
                                        .foregroundStyle(.accent)
                                        .multilineTextAlignment(.trailing)
                                        .frame(maxWidth: 100, alignment: .center)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    WalletRecentTransactionsView(transactions: [
        Transaction(name: "Groceries", amount: -2250, date: Date(), icon: "Basket", cardType: CardType.cardtype_visa.displayName, cashBack: 0),
        Transaction(name: "Toiletries", amount: 0, date: Date(), icon: "Basket", cardType: CardType.cardtype_masterCardc.displayName, cashBack: 2),
    ])
}
