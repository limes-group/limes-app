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
                                    Text("MTN Data")
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
                                    Text("Vodacom Data")
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
                                    Text("Telkom Data")
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
                                    Text("Cell C Data")
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
