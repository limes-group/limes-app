//
//  VerificationView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct VerificationView: View {
    @State private var phoneNumber: String = "0677739828"
    @State private var pin1: String = "0"
    @State private var pin2: String = "0"
    @State private var pin3: String = "0"
    @State private var pin4: String = "0"
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Label("Sign up", image: "BlueDot")
                        .font(.manrope(size: 16))
                        .foregroundStyle(.lightBunker)
                        .multilineTextAlignment(.center)
                    
                    Image("VerificationIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 83, height: 114)
                    
                    Text("Verify it's you")
                        .bold()
                        .font(.darkerGrotesque(size: 48))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Enter your verification code we sent to \(phoneNumber.masked)")
                        .font(Font.system(.body, weight: .regular))
                        .font(.manrope(size: 15))
                        .foregroundStyle(.lightBunker)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 32, trailing: 0))
                    
                    HStack {
                        TextField("1", text: $pin1)
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .frame(width: 80, height: 50)
                            .background(.secondaryBunker)
                            .border(.darkBorder)
                            .cornerRadius(6)
                                                
                        TextField("1", text: $pin2)
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .frame(width: 80, height: 50)
                            .background(.secondaryBunker)
                            .border(.darkBorder)
                            .cornerRadius(6)
                        
                        TextField("1", text: $pin3)
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .frame(width: 80, height: 50)
                            .background(.secondaryBunker)
                            .border(.darkBorder)
                            .cornerRadius(6)
                        
                        TextField("1", text: $pin4)
                            .font(Font.system(.body, weight: .regular))
                            .font(.manrope(size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .frame(width: 80, height: 50)
                            .background(.secondaryBunker)
                            .border(.darkBorder)
                            .cornerRadius(6)
                    }
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 32, trailing: 0))
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Resend code")
                                .font(Font.system(.body, weight: .bold))
                                .font(.darkerGrotesque(size: 16))
                                .foregroundStyle(.white )
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .background(.secondaryBunker)
                                .buttonStyle(.borderedProminent)
                                .cornerRadius(16)
                        }
                        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
//                        .navigationDestination(isPresented: $isRegisterActive) {
//                            AuthView(isLoginMode: false)
//                                .navigationBarBackButtonHidden(true)
//                        }
                        
                        Button {
                            
                        } label: {
                            Text("Verify")
                                .font(Font.system(.body, weight: .bold))
                                .font(.darkerGrotesque(size: 16))
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .background(.accent)
                                .buttonStyle(.borderedProminent)
                                
                                .cornerRadius(16)
                        }
                        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
//                        .navigationDestination(isPresented: $isLoginActive) {
//                            AuthView(isLoginMode: true)
//                                .navigationBarBackButtonHidden(true)
//                        }
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding()
            }
            .appBackground()
        }
    }
}

extension StringProtocol {
    var masked: String {
        return String(repeating: "*", count: Swift.max(0, count-3)) + suffix(3)
    }
}

#Preview {
    VerificationView()
}
