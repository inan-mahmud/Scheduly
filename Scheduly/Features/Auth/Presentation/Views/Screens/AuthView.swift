//
//  ContentView.swift
//  Scheduly
//
//  Created by cefalo on 25/11/23.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct AuthView: View {
    
    let authViewModel: AuthViewModel
    
    init(authViewModel: AuthViewModel) {
        self.authViewModel = authViewModel
    }
    
    var body: some View {
        ZStack {
            GoogleSignInButton {
                authViewModel.signInWithGoogle { result in
                    switch result {
                    case .success(let authState):
                        switch authState {
                        case .loggedIn(let user):
                            print("User Logged in: \(user)")
                        case .loggedOut:
                            print("Logged Out")
                        }
                    case .failure(_):
                        print("Auth Error")
                        
                    }
                }
            }.padding(12)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(authViewModel: DependencyProvider.authViewModel)
    }
}
