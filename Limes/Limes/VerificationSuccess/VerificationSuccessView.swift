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
            LinearGradient(colors: [.blue, .purple],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack (spacing: 16) {
                Spacer()
                Text("Congratulations!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                Spacer(minLength: 24)
                
                Text("Your account has been successfully registered.")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(UIColor.secondaryLabel))
                    .padding()
                Spacer(minLength: 24)
                
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .foregroundColor(.blue)
                        .cornerRadius(16)
                    Text("REGISTERED")
                        .font(.system(size: 48))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                }
                Spacer(minLength: 24)
                
                Button {
//                    isLoginActive = true
                } label: {
                    Text("Start")
                        .bold()
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(.green)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(16)
                }
                .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
//                .navigationDestination(isPresented: $isLoginActive) {
//                    AuthView(isLoginMode: true)
//                        .navigationBarBackButtonHidden(true)
//                }
                Spacer()
                
                
            }
            .padding(16)
        }
        
    }
}

#Preview {
    VerificationSuccessView()
}
