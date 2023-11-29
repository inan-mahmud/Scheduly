//
//  AuthState.swift
//  Scheduly
//
//  Created by cefalo on 27/11/23.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

enum AuthState {
    case loggedIn(user: GIDGoogleUser)
    case loggedOut
}

enum AuthError : Error {
    case wrongCredentials
    case unknown
}


extension AuthError {
    init(gidSignInError error: Error?) {
        self = .unknown
    }
}
