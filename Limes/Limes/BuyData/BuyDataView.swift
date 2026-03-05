//
//  BuyDataView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import SwiftUI

struct BuyDataView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    Text("Buy data")
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
                                AccentButton(buttonTitle: "MTN Data") {
                                    Task {
                                        
                                    }
                                }
                                AccentButton(buttonTitle: "Vodacom Data") {
                                    Task {
                                        
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 4, trailing: 16))
                            
                            HStack {
                                AccentButton(buttonTitle: "Telkom Data") {
                                    Task {
                                        
                                    }
                                }
                                AccentButton(buttonTitle: "Cell C Data") {
                                    Task {
                                        
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 4, leading: 16, bottom: 8, trailing: 16))
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    
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
                            
                            VStack (alignment: .leading) {
                                Text("Ready to keep your number?")
                                    .font(.darkerGrotesqueBold(size: 20))
                                    .foregroundStyle(Color(.white))
                                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                                
                                Text("Insert your Limes SIM and dial *140# to start Porting. Follow the prompts quick and easy.")
                                    .font(.manrope(size: 15))
                                    .foregroundStyle(.lightBunker)
                                    .multilineTextAlignment(.center)
                                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 32, trailing: 0))
                            }
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    
                    Spacer()
                }
                .appBackground()
            }
        }
    }
}

#Preview {
    BuyDataView()
}
