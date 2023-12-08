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
    
    func fetchEvents(for user: GIDGoogleUser?, completion: (Result<GTLRCalendar_Events,Error>) -> Void) -> Void {
        guard let user = user else {
            
            return
        }
        let service = GTLRCalendarService()
        service.authorizer = user.fetcherAuthorizer
        
        let fetchEventsQuery = GTLRCalendarQuery_EventsList.query(withCalendarId: "inan.mahmud.dev@gmail.com")
        service.executeQuery(fetchEventsQuery) { (ticket,object,error) in
            guard let event = object as? GTLRCalendar_Events else{
                return
            }
            print(event)
        }
    }
}

