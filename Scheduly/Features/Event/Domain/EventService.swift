//
//  EventService.swift
//  Scheduly
//
//  Created by cefalo on 3/12/23.
//

import Foundation

class EventService {
    
  
    
    func fetchEvents(completion: @escaping () -> Void) -> Void {
        let urlRequest = URLRequest(url: Endpoint.events(withID: "inan.mahmud.dev@gmail.com").url)
        
        URLSession.shared.makeRequest(request: urlRequest) { result in
            switch result {
            case .success(let (data, response)):
                do {
                   let event =  try JSONDecoder().decode(Event.self, from: data)
                    print(event.summary)
                }catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}




// MARK: - Event
struct Event: Codable {
    let kind: String
    let etag, summary, description: String
    let updated, timeZone, accessRole: String
    let defaultReminders: [DefaultReminder]
    let nextSyncToken: String
    let items: [Item]
}

// MARK: - DefaultReminder
struct DefaultReminder: Codable {
    let method: String
    let minutes: Int
}

// MARK: - Item
struct Item: Codable {
    let kind, etag, id, status: String
    let htmlLink: String
    let created, updated, summary: String
    let creator, organizer: Creator
    let start, end: End
    let iCalUID: String
    let sequence: Int
    let attendees: [Attendee]
    let hangoutLink: String?
    let conferenceData: ConferenceData?
    let reminders: Reminders
    let eventType: String
    let description: String?
}

// MARK: - Attendee
struct Attendee: Codable {
    let email: String
    let organizer: Bool?
    let responseStatus: String
    let attendeeSelf: Bool?

    enum CodingKeys: String, CodingKey {
        case email, organizer, responseStatus
        case attendeeSelf = "self"
    }
}

// MARK: - ConferenceData
struct ConferenceData: Codable {
    let entryPoints: [EntryPoint]
    let conferenceSolution: ConferenceSolution
    let conferenceID: String

    enum CodingKeys: String, CodingKey {
        case entryPoints, conferenceSolution
        case conferenceID = "conferenceId"
    }
}

// MARK: - ConferenceSolution
struct ConferenceSolution: Codable {
    let key: Key
    let name: String
    let iconURI: String

    enum CodingKeys: String, CodingKey {
        case key, name
        case iconURI = "iconUri"
    }
}

// MARK: - Key
struct Key: Codable {
    let type: String
}

// MARK: - EntryPoint
struct EntryPoint: Codable {
    let entryPointType: String
    let uri: String
    let label: String
}

// MARK: - Creator
struct Creator: Codable {
    let email: String
    let creatorSelf: Bool?

    enum CodingKeys: String, CodingKey {
        case email
        case creatorSelf = "self"
    }
}

// MARK: - End
struct End: Codable {
    let dateTime: Date
    let timeZone: String
}

// MARK: - Reminders
struct Reminders: Codable {
    let useDefault: Bool
}
