//
//  CheckoutTotalsView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct CheckoutTotalsView: View {
    @Binding var subTotalPrice: Double
    @Binding var vouchersApplied: Double
    @Binding var deliveryFee: Double
    @Binding var total: Double
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Subtotal")
                        .font(.manrope(size: 14))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    Text(subTotalPrice, format: .currency(code: "ZAR"))
                        .font(.manrope(size: 14))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                
                HStack {
                    Text("Vouchers Applied")
                        .font(.manrope(size: 14))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    Text(vouchersApplied, format: .currency(code: "ZAR"))
                        .font(.manrope(size: 14))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                
                HStack {
                    Text("Delivery fee")
                        .font(.manrope(size: 14))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    Text(deliveryFee, format: .currency(code: "ZAR"))
                        .font(.manrope(size: 14))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                
                HStack {
                    Text("Total")
                        .font(.manropeBold(size: 16))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Text(total, format: .currency(code: "ZAR"))
                        .font(.manropeBold(size: 16))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            }
            .appBackground()
        }
    }
}

#Preview {
    CheckoutTotalsView(subTotalPrice: .constant(100), vouchersApplied: .constant(-0), deliveryFee: .constant(0), total: .constant(100))
}
