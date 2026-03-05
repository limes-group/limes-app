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
                    .font(.darkerGrotesqueBold(size: 48))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text("Your account has been successfully registered!")
                    .font(.manrope(size: 15))
                    .foregroundStyle(.lightBunker)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 24, trailing: 0))
                
                Image("LimesIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 140, maxHeight: 110)
                    .padding(EdgeInsets(top: 80, leading: 0, bottom: 80, trailing: 0))
                
                AccentButton(buttonTitle: "Start squeezing Limes", height: 60) {
                    Task {
                        
                    }
                }
                .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                .padding()
                
                Spacer()
            }
            .appBackground()
        }
        
    }
}

#Preview {
    VerificationSuccessView()
}
