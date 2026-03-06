//
//  Route.swift
//  Limes
//
//  Created by Idol MacBook Pro on 2026/03/06.
//

import SwiftUI

enum Route: Hashable {
    case welcomeView
    case loginView
    case signupView
    case verifyUserView
    case forgotPasswordView
    case walletHomeTabView
    
    @ViewBuilder
    var destination: some View {
        switch self {
            case .welcomeView:
                WelcomeView()
                .navigationBarBackButtonHidden(true)
            case .loginView:
                LoginView()
                .navigationBarBackButtonHidden(true)
            case .signupView:
                SignUpView()
                .navigationBarBackButtonHidden(true)
            case .verifyUserView:
                VerificationView()
                .navigationBarBackButtonHidden(true)
            case .forgotPasswordView:
                ForgotPasswordView()
                .navigationBarBackButtonHidden(true)
            case .walletHomeTabView:
                HomeTabView()
                .navigationBarBackButtonHidden(true)
        }
    }
}
