//
//  AuthenticationView.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/06.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @State var userValidator = UserValidator()
    
    var body: some View {
        NavigationStack {
            LoginView()
//            if viewModel.isSignedIn {
//                HomeTabView()
//            } else {
//                
//            }
        }
//        .onAppear {
//            viewModel.signedIn = viewModel.isSignedIn
//        }
    }
}

#Preview {
    AuthenticationView()
}
