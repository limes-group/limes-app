//
//  CheckoutListView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct CheckoutListView: View {
    @State private var spaceSize = CGSize(width: .zero, height: (CGFloat(80 + (1 * 30))))
    @Binding var checkoutItems: [CheckoutListItem]    
    
    var body: some View {
        ViewThatFits {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: (spaceSize.height))
                    .foregroundStyle(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.secondaryBunker, lineWidth: 2)
                    )
                    .onAppear {
                        spaceSize.height = CGFloat(80 + (checkoutItems.count * 30))
                    }
                VStack {
                    Text("Your Items")
                        .font(.manropeBold(size: 24))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(checkoutItems) { item in
                        ListItemsView(count: item.itemCount, title: item.itemTitle, price: item.itemPrice)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
            }
        }
    }
    
    struct ListItemsView: View {
        var count: Int
        var title: String
        var price: Double
        
        var body: some View {
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                    Text("\(count)")
                        .font(.manrope(size: 12))
                        .foregroundStyle(.black)
                }
                Text(title)
                    .font(.manropeBold(size: 14))
                    .foregroundStyle(.white)
                
                Spacer()
                Text(price, format: .currency(code: "ZAR"))
                    .font(.manropeBold(size: 14))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    CheckoutListView(checkoutItems: .constant([CheckoutListItem(itemCount: 1, itemTitle: "Data - 1GB", itemPrice: 100)]))
}
