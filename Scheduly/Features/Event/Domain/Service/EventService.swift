//
//  EventService.swift
//  Scheduly
//
//  Created by cefalo on 3/12/23.
//

import Foundation
import GoogleAPIClientForRESTCore
import GoogleAPIClientForREST_Calendar
import GoogleSignIn
import GoogleSignInSwift


class EventService {
    
    func fetchEvents(for user: GIDGoogleUser?, completion: @escaping (Result<[GTLRCalendar_Event],EventError>) -> Void) -> Void {
        
        guard let user = user else {
            completion(.failure(.userNotFound))
            return
        }
        let service = GTLRCalendarService()
        service.authorizer = user.fetcherAuthorizer
        
        guard let profile = user.profile else {
            completion(.failure(.profileNotFound))
            return
        }
        
        let fetchEventsQuery = GTLRCalendarQuery_EventsList.query(withCalendarId: profile.email)
        
        service.executeQuery(fetchEventsQuery) { (ticket,object,error) in
            guard let event = object as? GTLRCalendar_Events else {
                completion(.failure(.eventsNotFound))
                return
            }
            
            guard let items = event.items else {
                completion(.failure(.eventsNotFound))
                return
            }
            completion(.success(items))
        }
    }
}


