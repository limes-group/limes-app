//
//  ForgotPasswordView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

enum Selection: String, CaseIterable, Identifiable {
    case email = "Email"
    case phoneNumber = "Phone number"
    
    var id: Self { self }
}

struct ForgotPasswordView: View {
    @State private var countryCode = "+27"
    @State private var phoneNumber: String = ""
    @State private var emailAddress: String = "balleng2@gmail.com"
    @State private var selectedOption: Selection = .email
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Label("Forgot password", image: "BlueDot")
                        .font(.manrope(size: 16))
                        .foregroundStyle(.lightBunker)
                        .multilineTextAlignment(.center)
                    
                    Text("Reset your password")
                        .font(.darkerGrotesqueBold(size: 48))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: 4, leading: 0, bottom: 24, trailing: 0))
                    
                    Text("Enter your email or phone number")
                        .font(.manrope(size: 15))
                        .foregroundStyle(.lightBunker)
                        .padding(EdgeInsets(top: 4, leading: 0, bottom: 24, trailing: 0))
                    
                    HStack {
                        
                        Button {
                            self.selectedOption = .email
                        } label: {
                            Text("Email")
                                .font(.darkerGrotesqueBold(size: 16))
                                .foregroundStyle(self.selectedOption == .email ? Color.black : Color.white )
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .background(self.selectedOption == .email ? Color.accent : Color.secondaryBunker)
                                .buttonStyle(.borderedProminent)
                                .cornerRadius(16)
                        }
                        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                        
                        Button {
                            self.selectedOption = .phoneNumber
                        } label: {
                            Text("Phone number")
                                .font(Font.system(.body, weight: .bold))
                                .font(.darkerGrotesque(size: 16))
                                .foregroundStyle(self.selectedOption == .phoneNumber ? Color.black : Color.white)
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .background(self.selectedOption == .phoneNumber ? Color.accent : Color.secondaryBunker)
                                .buttonStyle(.borderedProminent)
                                
                                .cornerRadius(16)
                        }
                        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
                    
                    if (self.selectedOption == .email) {
                        Text("Email address")
                            .font(.manropeMedium(size: 14))
                            .foregroundStyle(Color(.white))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Email address", text: .constant(""))
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .background(.secondaryBunker)
                            .border(.darkBorder)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                    } else {
                        Text("Phone number")
                            .font(.manropeMedium(size: 14))
                            .foregroundStyle(Color(.white))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            // Country Code / Picker
                            Text(countryCode)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 10)
                                .cornerRadius(8)
                            Rectangle()
                                .frame(maxWidth: 1, maxHeight: 44)
                                .foregroundStyle(Color(.darkBorder))
                            // Phone Number Field
                            TextField("Phone number", text: $phoneNumber)
                                .keyboardType(.phonePad)
                                .foregroundStyle(.white)
                                .background(.secondaryBunker)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(.secondaryBunker)
                        .border(.darkBorder)
                        .cornerRadius(8)
                        .shadow(radius: 1)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    }
                    
                    AccentButton(buttonTitle: "Reset") {
                        Task {
                            
                        }
                    }
                    .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 5)
                    Spacer()
                }
                .padding()
            }
            .appBackground()
        }
    }
}

#Preview {
    ForgotPasswordView()
}
