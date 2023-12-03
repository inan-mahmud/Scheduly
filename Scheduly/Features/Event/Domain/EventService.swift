//
//  EventService.swift
//  Scheduly
//
//  Created by cefalo on 3/12/23.
//

import Foundation

class EventService {
    func fetchEvents(completion: @escaping (Result<Event,Error>) -> Void) -> Void {
        
        var urlRequest = URLRequest(url: Endpoint.events(withID: "en.bd#holiday@group.v.calendar.google.com").url)
        URLSession.shared.makeRequest(request: urlRequest) { result in
            switch result {
            case .success(let data):
                do {
                   let event =  try JSONDecoder().decode(Event.self, from: data)
                    completion(.success(event))
                }catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


struct Event: Codable{
    let kind: String
    let etag: String
    let summary: String
    let description: String
    let updated: String
    let timeZone: String
    let accessRole: String
    struct DefaultReminders: Codable {
        let method: String
        let minutes: Int
    }
    let defaultReminders: [DefaultReminders]
    let nextSyncToken: String
    struct Item: Codable {
        let kind: String
        let etag: String
        let id: String
        let status: String
    }
    let items: [Item]
}
