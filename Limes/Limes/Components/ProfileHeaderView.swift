//
//  ProfileHeaderView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/02/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 65)
                .background(Color.secondaryBunker)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondaryBunker, lineWidth: 1) // Overlay the border
                )
            
            VStack (spacing: 8) {
                HStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 94, height: 26)
                    Spacer()
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(maxWidth: 78, maxHeight: 50)
                                .background(Color.secondaryBunker)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.secondaryBunker, lineWidth: 1) // Overlay the border
                                )
                            
                            HStack (spacing: 8) {
                                Spacer()
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .frame(width: 8, height: 5)
                                        .bold()
                                        .foregroundStyle(Color.white)
                                }
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        }
                        
                    }
                    .frame(maxWidth: 78, maxHeight: 65)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 65)
    }
}

#Preview {
    ProfileHeaderView()
}
