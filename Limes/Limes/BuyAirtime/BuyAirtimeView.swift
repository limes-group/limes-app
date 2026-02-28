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
                        .font(.darkerGrotesque(size: 30))
                        .bold()
                        .foregroundStyle(Color(.white))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                                        
                    Text("Select service provider")
                        .font(Font.system(.body, weight: .medium))
                        .font(.manrope(size: 14))
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
                                Button {
                                    
                                } label: {
                                    Text("MTN airtime")
                                        .font(Font.system(.body, weight: .bold))
                                        .font(.darkerGrotesque(size: 16))
                                        .foregroundStyle(.black )
                                        .frame(height: 40)
                                        .frame(maxWidth: .infinity)
                                        .background(.accent)
                                        .buttonStyle(.borderedProminent)
                                        .cornerRadius(16)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Text("Vodacom airtime")
                                        .font(Font.system(.body, weight: .bold))
                                        .font(.darkerGrotesque(size: 16))
                                        .foregroundStyle(.black )
                                        .frame(height: 40)
                                        .frame(maxWidth: .infinity)
                                        .background(.accent)
                                        .buttonStyle(.borderedProminent)
                                        .cornerRadius(16)
                                }
                            }
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 4, trailing: 16))
                            
                            HStack {
                                Button {
                                    
                                } label: {
                                    Text("Telkom airtime")
                                        .font(Font.system(.body, weight: .bold))
                                        .font(.darkerGrotesque(size: 16))
                                        .foregroundStyle(.black )
                                        .frame(height: 40)
                                        .frame(maxWidth: .infinity)
                                        .background(.accent)
                                        .buttonStyle(.borderedProminent)
                                        .cornerRadius(16)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Text("Cell C airtime")
                                        .font(Font.system(.body, weight: .bold))
                                        .font(.darkerGrotesque(size: 16))
                                        .foregroundStyle(.black )
                                        .frame(height: 40)
                                        .frame(maxWidth: .infinity)
                                        .background(.accent)
                                        .buttonStyle(.borderedProminent)
                                        .cornerRadius(16)
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
                                    .font(.darkerGrotesque(size: 20))
                                    .bold()
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
