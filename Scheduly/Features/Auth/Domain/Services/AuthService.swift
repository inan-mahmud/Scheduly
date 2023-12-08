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
        let additionalScopes = [
            "https://www.googleapis.com/auth/calendar",
            "https://www.googleapis.com/auth/calendar.events",
            "https://www.googleapis.com/auth/calendar.events.readonly",
            "https://www.googleapis.com/auth/calendar.readonly"
                   ]
        GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationUtility.rootViewController,hint: nil,additionalScopes: additionalScopes) { signInResult, error in
            if let signInResult {
                completion(.success(signInResult))
                
            } else {
                completion(.failure(.unknown))
              }
        }
    }
    
    func restorePreviousSignIn(completion: @escaping (Result<GIDGoogleUser, AuthError>) -> Void) {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let user {
                completion(.success(user))
            } else {
                completion(.failure(.tokenExpired))
            }

        }
    }
    
    func openURL(url: URL) {
        GIDSignIn.sharedInstance.handle(url)
    }
}
