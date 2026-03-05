//
//  CheckoutDoneView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct CheckoutDoneView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .foregroundStyle(.black)
                    Image("CheckoutDone")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85, height: 74)
                    
                    Text("All done!")
                        .font(.darkerGrotesqueBold(size: 36))
                        .foregroundStyle(.white)
                        .padding(0)
                    
                    Text("Your order is complete! Track your order here.")
                        .font(.manrope(size: 15))
                        .foregroundStyle(.white)
                    
                    NavigationLink(destination: {
                        HomeTabView()
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        AccentButtonView(buttonTitle: "Back to my Wallet", width: 200, height: 40)
                    })
                    Spacer()
                }
                .appBackground()
            }
        }
    }
}

#Preview {
    CheckoutDoneView()
}
