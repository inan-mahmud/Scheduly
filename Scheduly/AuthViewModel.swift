//
//  AuthViewModel.swift
//  Scheduly
//
//  Created by cefalo on 27/11/23.
//

import Foundation

final class AuthViewModel: ObservableObject {
    
    @Published var authState: AuthState = .loggedOut
    
    
    private let authService = AuthService()
    
    func signInWithGoogle(completion: @escaping ((Result<AuthState, AuthError>) -> Void)) {
        authService.signInWithGoogle { [weak self] result in
            switch result {
            case .success(let signInResult):
                self?.authState = AuthState.loggedIn(user: signInResult.user)
            case .failure(_):
                self?.authState = AuthState.loggedOut
            }
        }
    }
    
    func restorePreviousSignIn() {
        authService.restorePreviousSignIn { [weak self] result in
            switch result {
            case .success(let user):
                self?.authState = AuthState.loggedIn(user: user)
            case .failure(_):
                self?.authState = AuthState.loggedOut
            }
        }
    }
}



