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
    
    func createEvent(for user: GIDGoogleUser?) {
        
        guard let user = user else {
            return
        }
        
        let service = GTLRCalendarService()
        service.authorizer = user.fetcherAuthorizer
        
        let calendarEvent = GTLRCalendar_Event()
        calendarEvent.summary = "test"
        calendarEvent.descriptionProperty = "test description"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let startDate = dateFormatter.date(from: "25/12/2023 09:00")
        let endDate = dateFormatter.date(from: "25/12/2023 10:00")
        
        guard let startDate = startDate else{
            return
        }
        
        guard let endDate = endDate else{
            return
        }
        
        calendarEvent.start = buildDate(date: startDate)
        calendarEvent.end = buildDate(date: endDate)
        
        let insertQuery = GTLRCalendarQuery_EventsInsert.query(withObject: calendarEvent, calendarId: "inan.mahmud.dev@gmail.com")
        
        service.executeQuery(insertQuery) { (ticket, object, error) in
            guard let event = object as? GTLRCalendar_Event else {
                return
            }
            print(event)
        }
    }
    
    private func buildDate(date: Date) -> GTLRCalendar_EventDateTime {
            let datetime = GTLRDateTime(date: date)
            let dateObject = GTLRCalendar_EventDateTime()
            dateObject.dateTime = datetime
            return dateObject
        }
}


