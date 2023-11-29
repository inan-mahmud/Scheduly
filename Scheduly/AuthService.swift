//
//  AuthService.swift
//  Scheduly
//
//  Created by cefalo on 29/11/23.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift


final class AuthService {
    
    func signInWithGoogle(completion: @escaping (Result<GIDSignInResult, AuthError>) -> Void ) {
        GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationUtility.rootViewController) { signInResult, error in
            if let signInResult {
                completion(.success(signInResult))
            } else {
                completion(.failure(AuthError(gidSignInError: error)))
              }
          }
    }
    
    func restorePreviousSignIn(completion: @escaping (Result<GIDGoogleUser, AuthError>) -> Void) {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let user {
                completion(.success(user))
            } else {
                completion(.failure(AuthError(gidSignInError: error)))
            }

        }
    }
}
