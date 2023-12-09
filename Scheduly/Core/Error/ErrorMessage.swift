//
//  ErrorMessage.swift
//  Scheduly
//
//  Created by cefalo on 9/12/23.
//

import Foundation

enum ErrorMessage: String {
    case userNotFound, profileNotFound, tokenExpired, userMismatch = "Session Expired. Please Login Again"
    case noEvents = "Something went wrong! We couldn't find any events"
    case cancelled = "Sign in cancelled. Please try again by clicking onto the sign in button"
    case unknown = "Something went wrong! Please try again later"
}
