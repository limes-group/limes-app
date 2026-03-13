//
//  NotificationsTabView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/12.
//

import SwiftUI

struct NotificationsTabView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("My Profile")
                        .font(.darkerGrotesqueBold(size: 36))
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                .appBackground()
            }
        }
    }
}

#Preview {
    NotificationsTabView()
}
