//
//  EventError.swift
//  Scheduly
//
//  Created by cefalo on 8/12/23.
//

import Foundation

enum EventError {
    case userNotFound
    case profileNotFound
    case eventsNotFound
    
    var customDescription: String {
        
        switch self {
        case .userNotFound:
            return "Session Expired. Please Login Again"
        case .profileNotFound:
            return "Session Expired. Please Login Again"
        case .eventsNotFound:
            return "You don't have any events"
        }
    }
}
