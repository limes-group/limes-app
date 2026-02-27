//
//  CustomAlertView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/27.
//

import SwiftUI

struct CustomAlertView: View {
    let title: String
    let message: String
    let isOkayOnly: Bool
    @Binding var isPresented: Bool
    let confirmAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .bold()
                .font(.darkerGrotesque(size: 24))
                .foregroundStyle(.accent)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            Text(message)
                .font(.manrope(size: 16))
                .font(Font.system(.body, weight: .medium))
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
            
            Divider()
            
            if isOkayOnly {
                Button {
                    Task {
                        confirmAction()
                        isPresented = false
                    }
                } label: {
                    Text("Okay")
                        .font(Font.system(.body, weight: .bold))
                        .font(.darkerGrotesque(size: 16))
                        .foregroundStyle(.black )
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(.accent)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(16)
                }
                .padding()
            } else {
                HStack {
                    Button {
                        Task {
                            confirmAction()
                            isPresented = false
                        }
                    } label: {
                        Text("Cancel")
                            .font(Font.system(.body, weight: .bold))
                            .font(.darkerGrotesque(size: 16))
                            .foregroundStyle(.black )
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(16)
                    }
                    .padding()
                    Button {
                        Task {
                            confirmAction()
                            isPresented = false
                        }
                    } label: {
                        Text("Confirm")
                            .font(Font.system(.body, weight: .bold))
                            .font(.darkerGrotesque(size: 16))
                            .foregroundStyle(.black )
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(.accent)
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(16)
                    }
                    .padding()
                }
                .frame(height: 60)
            }
        }
        .appBackground()
        .frame(width: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 20)
    }
}


#Preview {
    CustomAlertView(title: "Error Message", message: "Invalid Response", isOkayOnly: false, isPresented: .constant(true), confirmAction: {
        
    })
}
