//
//  DepositView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/26.
//

import SwiftUI

struct Deposit: Identifiable, Hashable {
    var id = UUID()
    var depositType: String
    var imageName: String
}

struct DepositView: View {
    @State var deposits: [Deposit] = [
        Deposit(depositType: "Credit & Debit card", imageName: "Visa"),
        Deposit(depositType: "Instant EFT", imageName: "EFT"),
        Deposit(depositType: "ATM Deposit", imageName: "Visa"),
        Deposit(depositType: "Pay@ deposit", imageName: "Visa")
    ]
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    Text("Deposit")
                        .font(.darkerGrotesqueBold(size: 36))
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                    
                    ForEach(deposits, id: \.self) { deposit in
                        DepositCards(imageName: deposit.imageName, depositType: deposit.depositType)
                    }
                    
                    AccentButton(buttonTitle: "Continue", height: 60) {
                        Task {
                            
                        }
                    }
                    
                    Spacer()
                }
            }
            .appBackground()
        }
    }
    
    struct DepositCards: View {
        var imageName: String
        var depositType: String
        
        var body: some View {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 65)
                    .background(Color.secondaryBunker)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondaryBunker, lineWidth: 1) // Overlay the border
                    )
                
                VStack (alignment: .leading, spacing: 8) {
                    HStack (alignment: .firstTextBaseline) {
                        Image(imageName)
                            .resizable()
                            .frame(width: 37, height: 24)
                            .multilineTextAlignment(.leading)
                        
                        Text("\(depositType)")
                            .font(.manrope(size: 16))
                            .foregroundStyle(Color(.white))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                   }
                    
                    
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 65)
        }
    }
}

#Preview {
    DepositView()
}
