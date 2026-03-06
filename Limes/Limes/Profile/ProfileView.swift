//
//  ProfileView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/05.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.navigate) private var navigate
    @ObservedObject var viewModel = LoginViewModel()
    @State var profile: User
    @State var listIndex: String = ""
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack{
                    Text("My Profile")
                        .font(.darkerGrotesqueBold(size: 36))
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.center)
                    
                    Image("ProfilePicture")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text(profile.fullName)
                        .font(.darkerGrotesqueBold(size: 24))
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.center)
                    
                    VariableBlackButton(buttonTitle: "Edit profile", width: 120, height:48) {
                        Task {
                            
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    
                    ProfileBlockView(profile: $profile, listIndex: $listIndex)
                    
                    Spacer()
                }
            }
        }
        .appBackground()
        .onChange(of: listIndex) {
            if listIndex == "Logout" {
                Task {
                    try? await Task.sleep(for: .seconds(0.1))
                    viewModel.signOut()
                    try? await Task.sleep(for: .seconds(0.5))
                    navigate(.welcomeView)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var routes:[Route] = []
    
    NavigationStack(path: $routes) {
        ProfileView(profile:
                        User(id: "1",
                             email: "balleng2@gmail.com",
                             phoneNumber: "0677739828",
                             fullName: "Wayne Moosa",
                             photoURL: nil)
        )
        .navigationDestination(for: Route.self) { route in
            route.destination
        }
    }
    .environment(\.navigate, NavigationAction(action: { route in
        routes.append(route)
    }))
}
