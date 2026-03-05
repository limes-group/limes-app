//
//  ProfileBlockView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct ProfileBlockView: View {
    @Binding var profile: User
    @State var profileFeature = [
        ProfileListItem(title: "Notification centre", badge: 10, icon: "chevron.right"),
        ProfileListItem(title: "My orders", badge: nil, icon: "chevron.right"),
        ProfileListItem(title: "Linked cards", badge: nil, icon: "chevron.right"),
        ProfileListItem(title: "Saved addresses", badge: nil, icon: "chevron.right"),
        ProfileListItem(title: "Help", badge: nil, icon: "chevron.right"),
        ProfileListItem(title: "Logout", badge: nil, icon: "rectangle.portrait.and.arrow.right")
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 420)
                .foregroundStyle(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.secondaryBunker, lineWidth: 2)
                )
            VStack {
                EmailView(email: profile.email)
                PhoneNumberView(phoneNumber: profile.phoneNumber)
                
                ForEach(profileFeature) { feature in
                    ListItemsView(title: feature.title, badge: feature.badge, icon: feature.icon)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
        }
    }
    
    struct EmailView: View {
        let email: String
        
        var body: some View {
            HStack {
                Text("Email")
                    .font(.darkerGrotesqueBold(size: 18))
                    .foregroundColor(.white)
                Spacer()
                
                Text(email)
                    .font(.manrope(size: 14))
                    .foregroundColor(.gray)
                VariableAccentView(buttonTitle: "Verify", width: 70, height: 36) {
                    Task {
                        
                    }
                }
            }
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundStyle(.gray)
        }
    }
    
    struct PhoneNumberView: View {
        let phoneNumber: String
        
        var body: some View {
            HStack {
                Text("Mobile number")
                    .font(.darkerGrotesqueBold(size: 18))
                    .foregroundColor(.white)
                Spacer()
                
                Text(phoneNumber)
                    .font(.manrope(size: 14))
                    .foregroundColor(.gray)
            }
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundStyle(.gray)
        }
    }
    
    struct ListItemsView: View {
        let title: String
        let badge: Int?
        let icon: String
        
        var body: some View {
            HStack {
                Text(title)
                    .font(.darkerGrotesqueBold(size: 18))
                    .foregroundColor(.white)
                Spacer()
                if (badge != nil) {
                    ZStack {
                        Rectangle()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.red)
                        Text("\(String(describing: Int(badge!)))")
                            .font(.manropeBold(size: 12))
                            .foregroundColor(.white)
                    }
                }
                if (icon == "chevron.right") {
                    Image(systemName: icon)
                        .resizable()
                        .foregroundStyle(Color.white)
                        .frame(width: 12, height: 14)
                } else {
                    Image(systemName: icon)
                        .resizable()
                        .foregroundStyle(Color.white)
                        .frame(width: 20, height: 16)
                }
            }
            if (icon == "chevron.right") {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    @Previewable @State var profile = User(id: "1",
                                email: "balleng2@gmail.com",
                                phoneNumber: "0677739828",
                                fullName: "Wayne Moosa",
                                photoURL: nil)
    ProfileBlockView(profile: $profile)
}
