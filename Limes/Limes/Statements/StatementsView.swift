//
//  StatementsView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import SwiftUI

struct StatementsView: View {
    let statementsHeader = ["All", "Cash In", "Cash Out"]
    @State private var selectedStatement = 0
    let statements = [
        Statement(id: 0, title: "Groceries", amount: -2250, date: "13 Feb 2026"),
        Statement(id: 0, title: "Bill payment", amount: -250, date: "14 Feb 2026"),
        Statement(id: 0, title: "Transfer (P2P)", amount: -5850, date: "17 Feb 2026 17:06"),
        Statement(id: 0, title: "Pay@ deposit", amount: 250, date: "19 Feb 2026 13:10"),
        Statement(id: 0, title: "Vas purchase (MTN data)", amount: -2250, date: "20 Feb 2026 07:30"),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    Text("Statements")
                        .font(.darkerGrotesqueBold(size: 36))
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    
                    Picker("", selection: $selectedStatement) {
                        ForEach(0..<statementsHeader.count, id: \.self) { index in
                            Text(self.statementsHeader[index])
                                .tag(index)
                        }
                    }
                    .background(.secondaryBunker)
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    ScrollView {
                        ForEach(Array(statements.indices).sorted(), id: \.self) { key in
                            let statement = statements[key]
                            StatementDetailView(title: statement.title, amount: Decimal(statement.amount), statementDate: statement.date)
                            
                        }
                    }
                    
                    Spacer()
                }
            }
            .appBackground()
        }
    }
    
    struct StatementDetailView: View {
        var title: String
        var amount: Decimal
        var statementDate: String
        
        var body: some View {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 65)
                    .background(Color.secondaryBunker)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondaryBunker, lineWidth: 1)
                    )
                
                VStack (spacing: 8) {
                    HStack () {
                        Text(title)
                            .font(.darkerGrotesqueBold(size: 16))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(Color(.white))
                            .frame(maxWidth: .infinity)
                        
                        Spacer()
                        
                        Text(amount, format: .currency(code: "ZAR"))
                            .font(.darkerGrotesqueBold(size: 16))
                            .foregroundStyle(amount > 0 ? Color(.green) : Color(.red))
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .trailing)
                    }
                    
                    Text(statementDate)
                        .font(.darkerGrotesqueBold(size: 14))
                        .foregroundStyle(.lightBunker)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
            .frame(maxWidth: .infinity, maxHeight: 65)
        }
    }
}

#Preview {
    StatementsView()
}
