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
            return ErrorMessage.cancelled.rawValue
        case .userMismatch:
            return ErrorMessage.userMismatch.rawValue
        case .tokenExpired:
            return ErrorMessage.tokenExpired.rawValue
        case .unknown:
            return ErrorMessage.unknown.rawValue
        }
    }
}
