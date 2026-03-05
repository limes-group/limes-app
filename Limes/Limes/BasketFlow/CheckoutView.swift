//
//  CheckoutView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct CheckoutView: View {
    @State var checkoutItems = [
        CheckoutListItem(itemCount: 1, itemTitle: "Data - 1GB", itemPrice: 100),
        CheckoutListItem(itemCount: 1, itemTitle: "Showmax Voucher", itemPrice: 200),
        CheckoutListItem(itemCount: 1, itemTitle: "Airtime MTN 30", itemPrice: 30),
    ]
    @State var subTotalPrice: Double = 100
    @State var vouchersApplied: Double = -0
    @State var deliveryFee: Double = 0
    @State var total: Double = 100
    @State var address: Address = Address(street: "188 Aureole Avenu", city: "Randburg", province: "Gauteng", Country: "South Africa", postalCode: "2016")
        
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Checkout")
                        .font(.darkerGrotesqueBold(size: 36))
                        .foregroundStyle(Color(.white))
                    
                    Text("Review your items and delivery details")
                        .font(.manrope(size: 14))
                        .foregroundStyle(Color(.white))
                    
                    CheckoutListView(checkoutItems: $checkoutItems)
                        .padding()
                    
                    CheckoutTotalsView(subTotalPrice: $subTotalPrice, vouchersApplied: $vouchersApplied, deliveryFee: $deliveryFee, total: $total)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    
                    CheckoutAddressView(address: $address)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    
                    Spacer()
                    
                    CheckoutButton(items: nil, buttonTitle: "Checkout", price: 100) {
                        Task {
                            
                        }
                    }
                }
                .appBackground()
            }
        }
    }
}

#Preview {
    CheckoutView(checkoutItems: ([
        CheckoutListItem(itemCount: 1, itemTitle: "Data - 1GB", itemPrice: 100),
        CheckoutListItem(itemCount: 1, itemTitle: "Showmax Voucher", itemPrice: 200),
        CheckoutListItem(itemCount: 1, itemTitle: "Airtime MTN 30", itemPrice: 30),
    ]))
}
