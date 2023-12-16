//
//  SchedulyApp.swift
//  Scheduly
//
//  Created by cefalo on 25/11/23.
//

import SwiftUI

@main
struct SchedulyApp: App {
    
    @StateObject var authViewModel = DependencyProvider.authViewModel
        
    var body: some Scene {
        WindowGroup {
            VStack {
                switch authViewModel.authState {
                case .loggedIn:
                    DashboardView().environmentObject(authViewModel)
                case .loggedOut:
                    AuthView(authViewModel: authViewModel)
                }
            }
            .onOpenURL { url in
                authViewModel.openURL(url: url)
            }
            .onAppear {
                authViewModel.restorePreviousSignIn()
            }
        }
    }
}
