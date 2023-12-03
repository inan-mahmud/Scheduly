//
//  Endpoint.swift
//  Scheduly
//
//  Created by cefalo on 2/12/23.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}


extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.googleapis.com"
        components.path = "/calendar/v3/" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }
        return url
    }
}

extension Endpoint {
    static func events(withID id: String) -> Self {
        Endpoint(path: "calendars/\(id)/events",queryItems: [URLQueryItem(name: "key", value: "AIzaSyDntYy6mHV9UH1LTt5B2aQNFrgV_3DTJJA")])
    }
    
    static func event(withCalendarID calendarID: String, withEventID eventID: String) -> Self {
        Endpoint(path: "calendars/\(calendarID)/events/\(eventID)")
    }
}
