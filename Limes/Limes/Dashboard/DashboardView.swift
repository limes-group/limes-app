//
//  DashboardView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct DashboardView: View {
    @State var userName = "John Smith"
    @State var cardType: String = "Limes Platinum"
    @State var cardNumber: String = "4242 4242 4242 4242"
    @State var expiryDate: String = "02/26"
    @State var availableBalance: Double = 10000
    @State private var isSecure: Bool = true
    @State var transactions: [Transaction] = [
        Transaction(name: "Groceries", amount: 2250, date: Date(), icon: "Basket", cardType: CardType.cardtype_visa.displayName),
        Transaction(name: "Toiletries", amount: 5000, date: Date(), icon: "Basket", cardType: CardType.cardtype_masterCardc.displayName),
        Transaction(name: "Rent", amount: 9000, date: Date(), icon: "Basket", cardType: CardType.other.displayName)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    VStack (alignment: .leading) {
                        ProfileHeaderView()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                        
                        Text("Hello, \(userName)")
                            .font(.darkerGrotesque(size: 24))
                            .bold()
                            .foregroundStyle(Color(.white))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Welcome to your dashboard")
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 15))
                            .foregroundStyle(.lightBunker)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
                        
                        cardInformation(cardType: cardType, cardNumber: cardNumber, userName: userName, expiryDate: expiryDate)
                        
                        Text("Available balances")
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 15))
                            .foregroundStyle(Color.lightBunker)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                        
                        HStack(alignment: .center) {
                            Text(availableBalance, format: .currency(code: "ZAR").precision(.fractionLength(2)))
                                .font(.darkerGrotesque(size: 36))
                                .bold()
                                .foregroundStyle(Color(.white))
                                .multilineTextAlignment(.leading)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                            
                            Button(action: { isSecure.toggle() }) {
                                Image(systemName: isSecure ? "eye.slash" : "eye")
                                    .foregroundColor(.lightBunker)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                        
                        userOptions()
                        
                        recentTransactions(transactions: transactions)
                        Spacer()
                    }
                    .padding()
                }
                .appBackground()
            }
        }
        .onAppear() {
            cardNumber = cardNumber.replacingOccurrences(of: " ", with: "")
            cardNumber = formatCardNumber(cardNumber.properMask())
        }
    }
    
    func formatCardNumber(_ number: String) -> String {
        var formatted = ""
        for (index, character) in number.enumerated() {
            if index > 0 && index % 4 == 0 {
                formatted.append(" ")
            }
            formatted.append(character)
        }
        return formatted
    }
    
    struct cardInformation: View {
        var cardType: String
        var cardNumber: String
        var userName: String
        var expiryDate: String
        
        var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 199)
                        .foregroundStyle(Color.accent)
                        .cornerRadius(8)
                    
                    VStack (spacing: 16) {
                        HStack {
                            Text("\(cardType)")
                                .font(.manrope(size: 15))
                                .font(Font.system(.body, weight: .regular))
                                .foregroundStyle(Color(.bunker))
                            Spacer()
                            Image(systemName: "eye")
                                .resizable()
                                .frame(width: 16, height: 10)
                                .foregroundStyle(Color(.bunker))
                        }
                        
                        Text("\(cardNumber)")
                            .font(.darkerGrotesque(size: 24))
                            .bold()
                            .foregroundStyle(Color(.bunker))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Text("CARD HOLDER")
                                .font(.manrope(size: 12))
                                .font(Font.system(.body, weight: .regular))
                                .foregroundStyle(Color(.bunker))
                            Spacer()
                            Text("EXPIRES")
                                .font(.manrope(size: 12))
                                .font(Font.system(.body, weight: .regular))
                                .foregroundStyle(Color(.bunker))
                        }
                        
                        HStack {
                            Text("\(userName)")
                                .font(.darkerGrotesque(size: 18))
                                .bold()
                                .textCase(Text.Case.uppercase)
                                .foregroundStyle(Color(.bunker))
                            Spacer()
                            Text("\(expiryDate)")
                                .font(.darkerGrotesque(size: 18))
                                .bold()
                                .foregroundStyle(Color(.bunker))
                        }
                        .padding(EdgeInsets(top: -8, leading: 0, bottom: 16, trailing: 0))
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
    
    struct userOptions: View {
        var body: some View {
            HStack (alignment: .center) {
                Spacer()
                Label("Top up", image: "TopUpIcon")
                    .font(.manropeMedium(size: 12))
                    .foregroundStyle(Color(Color.white))
                    .labelStyle(VerticalLabelStyle())
                    .frame(width: 60, height: 60)
                Spacer()
                
                Label("Transfer", image: "TransferIcon")
                    .font(.manropeMedium(size: 12))
                    .foregroundStyle(Color(Color.white))
                    .labelStyle(VerticalLabelStyle())
                Spacer()
                
                Label("Invest", image: "InvestIcon")
                    .font(.manropeMedium(size: 12))
                    .foregroundStyle(Color(Color.white))
                    .labelStyle(VerticalLabelStyle())
                Spacer()
                
                Label("Pay", image: "PayIcon")
                    .font(.manropeMedium(size: 12))
                    .foregroundStyle(Color(Color.white))
                    .labelStyle(VerticalLabelStyle())
                Spacer()
            }
            .labelReservedIconWidth(60)
        }
    }
    
    struct recentTransactions: View {
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
                                        .stroke(Color.secondaryBunker, lineWidth: 1) // Overlay the border
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
                                
                                Text(String(describing: transaction.amount))
                                    .font(.manrope(size: 15))
                                    .foregroundStyle(.illusion)
                                    .multilineTextAlignment(.trailing)
                                    .frame(maxWidth: 100, alignment: .center)
                                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

extension LabelStyle where Self == VerticalLabelStyle {
    static var vertical: VerticalLabelStyle {
        return VerticalLabelStyle()
    }
}

extension String {
    func properMask(visibleCount: Int = 4, maskCharacter: Character = "*") -> String {
        guard self.count > visibleCount else {
            return self
        }
        let maskLength = self.count - visibleCount
        let mask = String(repeating: maskCharacter, count: maskLength)
        let visibleSuffix = self.suffix(visibleCount)
        return mask + String(visibleSuffix)
    }
}

#Preview {
    DashboardView()
}
