//
//  EventModel.swift
//  Scheduly
//
//  Created by cefalo on 9/12/23.
//

import Foundation


struct Event {
    let eventItems: [EventItem]
    let eventTime: EventTime
    let attendees: [Attendees]
}

struct EventItem{
    let kind, id, status, summary: String
    let htmlLink: URL
    let start: EventTime
    let end: EventTime
}

struct EventTime {
    let dateTime: Date
    let timeZone: String
}

struct Attendees {
    let email: String
    let organizer: Bool?
    let isSelf: Bool?
    let responseStatus: String
}
