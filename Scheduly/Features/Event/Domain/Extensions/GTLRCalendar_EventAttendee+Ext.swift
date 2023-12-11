//
//  GTLRCalendar_EventAttendee+Ext.swift
//  Scheduly
//
//  Created by cefalo on 11/12/23.
//

import Foundation

import GoogleAPIClientForRESTCore
import GoogleAPIClientForREST_Calendar


enum AttendeeStatus: String {
    case needsAction = "User didn't respond yet"
    case accepted = "User accepted this event"
    case rejected = "User rejected this event"
}

extension GTLRCalendar_EventAttendee {
    
    var needAction: String { return AttendeeStatus.needsAction.rawValue }
    var accepted: String { return AttendeeStatus.accepted.rawValue }
    var rejected: String { return AttendeeStatus.rejected.rawValue }
    
    func getMessage() -> String {
        switch responseStatus {
        case "needAction":
            return needAction
        case "accepted":
            return accepted
        default:
            return rejected
        }
    }
}
