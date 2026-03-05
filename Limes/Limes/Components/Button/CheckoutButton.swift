//
//  CheckoutButton.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct CheckoutButton: View {
    let items: Int?
    let buttonTitle: String
    let price: Double
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                HStack {
                    if (items != nil) {
                        Text("\(Int(items!)) items")
                            .font(.darkerGrotesque(size: 14))
                            .foregroundStyle(.black )
                            .frame(maxWidth: .infinity, maxHeight: 60)
                    } else {
                        Text("")
                            .font(.darkerGrotesque(size: 14))
                            .foregroundStyle(.black )
                            .frame(maxWidth: .infinity, maxHeight: 60)
                    }
                    Spacer()
                    Text(buttonTitle)
                        .font(Font.system(.body, weight: .bold))
                        .font(.darkerGrotesque(size: 16))
                        .foregroundStyle(.black )
                        .frame(maxWidth: .infinity, maxHeight: 60)
                    Spacer()
                    Text(price, format: .currency(code: "ZAR"))
                        .font(.darkerGrotesque(size: 14))
                        .foregroundStyle(.black )
                        .frame(maxWidth: .infinity, maxHeight: 60)
                }
                .buttonStyle(.borderedProminent)
                .background(.accent)
                .cornerRadius(16)
            }
            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
        }
        .appBackground()
    }
}

#Preview {
    CheckoutButton(items: nil, buttonTitle: "Checkout", price: 100, action: {})
}
