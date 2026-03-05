//
//  VASView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/28.
//

import SwiftUI

struct VASView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProfileHeaderView()
                    
                    Text("Buy VAS")
                        .font(.darkerGrotesqueBold(size: 30))
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .background(Color.secondaryBunker)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.secondaryBunker, lineWidth: 1)
                            )
                        
                        TabView {
                            PageContent(title: "Limes Sim 1", buttonText: "Top up")
                            PageContent(title: "Limes Sim 2", buttonText: "Top up")
                            PageContent(title: "Limes Sim 3", buttonText: "Top up")
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .frame(maxHeight: 180)
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 180)
                            .background(Color.secondaryBunker)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.secondaryBunker, lineWidth: 1)
                            )
                        
                        VStack() {
                            HStack {
                                AccentButton(buttonTitle: "Airtime R0", height: 60) {
                                    Task {
                                        
                                    }
                                }
                                
                                AccentButton(buttonTitle: "Mobile Data 0GB", height: 60) {
                                    Task {
                                        
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 4, trailing: 16))
                            
                            HStack {
                                AccentButton(buttonTitle: "SMS 0 SMS", height: 60) {
                                    Task {
                                        
                                    }
                                }
                                
                                AccentButton(buttonTitle: "Voice Bundles 0 Min", height: 60) {
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
                                    .multilineTextAlignment(.trailing)
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
    
    struct PageContent: View {
        var title: String
        var buttonText: String
        
        var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .background(.secondaryBunker)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.secondaryBunker, lineWidth: 1)
                        )
                    
                    VStack (alignment: .leading) {
                        Text(title)
                            .font(.darkerGrotesqueBold(size: 20))
                            .foregroundStyle(Color(.white))
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                        
                        WhiteButton(buttonTitle: buttonText) {
                            Task {
                                
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 40, trailing: 16))
        }
    }
}

#Preview {
    VASView()
}
