//
//  AuthViewModel.swift
//  Scheduly
//
//  Created by cefalo on 27/11/23.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

final class AuthViewModel: ObservableObject {
    
    @Published var authState: AuthState = .loggedOut
    
    func signInWithGoogle(completion: @escaping ((Result<AuthState, AuthError>) -> Void)) {
        GIDSignIn.sharedInstance.signIn(
          withPresenting: ApplicationUtility.rootViewController) { signInResult, error in
            guard let result = signInResult else {
                completion(.failure(AuthError.unknown))
              return
            }
              completion(.success(AuthState.loggedIn(user: result.user)))
          }
    }
}
