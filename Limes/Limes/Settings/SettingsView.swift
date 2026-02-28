//
//  SettingsView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/20.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        ProfileHeaderView()
                        
                        Text("Settings")
                            .font(.darkerGrotesque(size: 36))
                            .bold()
                            .foregroundStyle(Color(.white))
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                        
                        SettingsBlockView(image: "person.fill", title: "Update profile")
                        
                        SettingsBlockView(image: "gearshape.fill", title: "Change account details")
                        
                        SettingsBlockView(image: "wallet.bifold.fill", title: "Add new bank account")
                        
                        SettingsBlockView(image: "creditcard.fill", title: "Add new card")
                        
                        VStack {
                            ZStack {
                                Rectangle()
                                    .frame(maxWidth: .infinity, maxHeight: 120)
                                    .background(Color.secondaryBunker)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.secondaryBunker, lineWidth: 1)
                                    )
                                
                                VStack (alignment: .leading) {
                                    Text("Ready to keep your number?")
                                        .font(.darkerGrotesque(size: 20))
                                        .bold()
                                        .foregroundStyle(Color(.white))
                                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                                    
                                    Text("Insert your Limes SIM and dial *140# to start Porting. Follow the prompts quick and easy.")
                                        .font(Font.system(.body, weight: .regular))
                                        .font(.manrope(size: 15))
                                        .foregroundStyle(.lightBunker)
                                        .multilineTextAlignment(.center)
                                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 32, trailing: 0))
                                }
                                .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
                            }
                        }
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                        
                        Spacer()
                    }
                }
            }
            .appBackground()
        }
    }
    
    struct SettingsBlockView: View {
        var image: String?
        var title: String
        
        var body: some View {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 65)
                    .background(Color.secondaryBunker)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondaryBunker, lineWidth: 1)
                    )
                
                VStack (spacing: 8) {
                    HStack (alignment: .center) {
                        Image(systemName: image ?? "home")
                            .resizable()
                            .foregroundStyle(Color(.white))
                            .frame(width: 30, height: 30)
                        
                        Text(title)
                            .font(.darkerGrotesque(size: 24))
                            .bold()
                            .foregroundStyle(Color(.white))
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))
                        
                        Spacer()
                    }
                }
                .padding()
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .frame(maxWidth: .infinity, maxHeight: 65)
        }
    }
}

#Preview {
    SettingsView()
}
