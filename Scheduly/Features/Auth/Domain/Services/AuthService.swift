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
        let additionalScopes = [
            "https://www.googleapis.com/auth/calendar",
            "https://www.googleapis.com/auth/calendar.events",
            "https://www.googleapis.com/auth/calendar.events.readonly",
            "https://www.googleapis.com/auth/calendar.readonly"
                   ]
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let user {
                let calendarScope = "https://www.googleapis.com/auth/calendar.readonly"
                let grantedScopes = user.grantedScopes
                if grantedScopes == nil || !grantedScopes!.contains(calendarScope){
                    user.addScopes(additionalScopes, presenting: ApplicationUtility.rootViewController) { signInResult, error in
                        guard let signInResult = signInResult else {
                            completion(.failure(.cancelled))
                            return
                        }
                        completion(.success(user))
                    }
                }
                completion(.success(user))
            } else {
                completion(.failure(.tokenExpired))
            }

        }
    }
}
