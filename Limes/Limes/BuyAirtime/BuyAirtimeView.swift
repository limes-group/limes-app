//
//  BuyAirtimeView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import SwiftUI

struct BuyAirtimeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    Text("Buy airtime")
                        .font(.darkerGrotesqueBold(size: 30))
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                                        
                    Text("Select service provider")
                        .font(.manropeMedium(size: 14))
                        .foregroundStyle(Color(.lightBunker))
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 140)
                            .background(Color.secondaryBunker)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.secondaryBunker, lineWidth: 1)
                            )
                        
                        VStack() {
                            HStack {
                                AccentButton(buttonTitle: "MTN airtime", height: 60) {
                                    Task {
                                        
                                    }
                                }
                                
                                AccentButton(buttonTitle: "Vodacom airtime", height: 60) {
                                    Task {
                                        
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 4, trailing: 16))
                            
                            HStack {
                                AccentButton(buttonTitle: "Telkom airtime", height: 60) {
                                    Task {
                                        
                                    }
                                }
                                
                                AccentButton(buttonTitle: "Cell C airtime", height: 60) {
                                    Task {
                                        
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 4, leading: 16, bottom: 8, trailing: 16))
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                    
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: 120)
                                .background(Color.secondaryBunker)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.secondaryBunker, lineWidth: 1)
                                )
                            
                            VStack (spacing: 8) {
                                Text("Banner")
                                    .font(.darkerGrotesqueBold(size: 20))
                                    .foregroundStyle(Color(.white))
                                
                                Image("Advert")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    
                    Spacer()
                }
                .appBackground()
            }
        }
    }
}

#Preview {
    BuyAirtimeView()
}
