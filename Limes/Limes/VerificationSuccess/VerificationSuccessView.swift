//
//  RegistrationDoneView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct VerificationSuccessView: View {
    var body: some View {
        ZStack {            
            VStack (spacing: 16) {
                Label("Success", image: "GreenDot")
                    .font(.manrope(size: 16))
                    .foregroundStyle(.lightBunker)
                    .multilineTextAlignment(.center)
                
                Text("Congratulations")
                    .bold()
                    .font(.darkerGrotesque(size: 48))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text("Your account has been successfully registered!")
                    .font(Font.system(.body, weight: .regular))
                    .font(.manrope(size: 15))
                    .foregroundStyle(.lightBunker)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 24, trailing: 0))
                
                Image("LimesIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 140, maxHeight: 110)
                    .padding(EdgeInsets(top: 80, leading: 0, bottom: 80, trailing: 0))
                
                Button {
//                    isLoginActive = true
                } label: {
                    Text("Start squeezing Limes")
                        .font(Font.system(.body, weight: .bold))
                        .font(.darkerGrotesque(size: 16))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(.green)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(16)
                }
                .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                .padding()
//                .navigationDestination(isPresented: $isLoginActive) {
//                    AuthView(isLoginMode: true)
//                        .navigationBarBackButtonHidden(true)
//                }
                Spacer()
            }
            .appBackground()
        }
        
    }
}

#Preview {
    VerificationSuccessView()
}
