//
//  AuthError.swift
//  Scheduly
//
//  Created by cefalo on 30/11/23.
//

import Foundation

enum AuthError : Error {
    case cancelled
    case userMismatch
    case tokenExpired
    case unknown
    
    var customDescription: String {
        
    switch self {
        case .cancelled:
            return " It looks like you canceled the sign-in process. If you wish to sign in, please try again by clicking the sign-in button. If you have any issues or concerns, feel free to contact our support team for assistance."
        case .userMismatch:
            return "It seems there's an issue with your previous session. Please sign in again to continue. If the problem persists, try refreshing the page or restarting the app. If you need assistance, feel free to contact support."
        case .tokenExpired:
            return "Oh no! It looks like your session has expired. Please sign in again to continue enjoying our app. If you were in the middle of something important, don't worry, your progress is saved. Need help? Contact our support team."
        case .unknown:
            return "Oops! Something went wrong!"
        }
    }
}
