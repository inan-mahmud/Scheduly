//
//  SchedulyApp.swift
//  Scheduly
//
//  Created by cefalo on 25/11/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@main
struct SchedulyApp: App {
    
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                switch authViewModel.authState {
                case .loggedIn:
                    DashboardView()
                case .loggedOut:
                    AuthView(authViewModel: authViewModel)
                }
            }
            .onOpenURL { url in
                GIDSignIn.sharedInstance.handle(url)
            }
            .onAppear {
                GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                    
                    if error != nil {
                        authViewModel.authState = .loggedOut
                        return
                    }
                    
                    guard let user: GIDGoogleUser = user else {
                        authViewModel.authState = .loggedOut
                        return
                    }
                    
                    authViewModel.authState = .loggedIn(user: user)

                }
            }
        }
    }
}
