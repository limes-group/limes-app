//
//  CheckoutAddressView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct CheckoutAddressView: View {
    @Binding var address: Address
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 160)
                .foregroundStyle(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.secondaryBunker, lineWidth: 2)
                )
            VStack {
                HStack {
                    Text("Delivery address")
                        .font(.manropeBold(size: 24))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    VariableAccentView(buttonTitle: "Add address", width: 140, height: 36) {
                        Task {
                            
                        }
                    }
                }
                .padding(0)
                
                HStack {
                    VStack {
                        Text("Default address")
                            .font(.manropeBold(size: 14))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(address.street), \(address.city), \(address.province), \(address.Country), \(address.postalCode)")
                            .font(.manrope(size: 14))
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(0)
                    Spacer()
                    Image(systemName: "checkmark.rectangle")
                        .resizable()
                        .frame(width: 28, height: 24)
                        .foregroundStyle(Color(.white))
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
    }
}

#Preview {
    CheckoutAddressView(address: .constant(Address(street: "188 Aureole Avenu", city: "Randburg", province: "Gauteng", Country: "South Africa", postalCode: "2016")))
}
