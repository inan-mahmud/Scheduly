//
//  EventError.swift
//  Scheduly
//
//  Created by cefalo on 8/12/23.
//

import Foundation

enum EventError: Error {
    case userNotFound
    case profileNotFound
    case eventsNotFound
    
    var customDescription: String {
        switch self {
            case .userNotFound:
                return ErrorMessage.userNotFound.rawValue
            case .profileNotFound:
                return ErrorMessage.userNotFound.rawValue
            case .eventsNotFound:
                return ErrorMessage.noEvents.rawValue
        }
    }
}
