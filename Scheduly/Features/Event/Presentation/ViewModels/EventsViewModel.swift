//
//  EventsViewModel.swift
//  Scheduly
//
//  Created by cefalo on 8/12/23.
//

import Foundation
import GoogleAPIClientForRESTCore
import GoogleAPIClientForREST_Calendar
import GoogleSignIn
import GoogleSignInSwift


final class EventsViewModel: ObservableObject {
    
    let eventsService:EventService
    
    init(service: EventService) {
        self.eventsService = service
    }
    
    @Published var eventsState: EventsState = .loading
    
    @Published var showSheet: Bool = false
    
    func fetchEvents(for user: GIDGoogleUser?) -> Void {
        eventsService.fetchEvents(for: user) {[weak self] result in
            switch result {
            case .success(let events):
                self?.eventsState = .data(events)
            case .failure(let error):
                self?.eventsState = .error(error.customDescription)
            }
        }
    }
    
    func createEvent(for user: GIDGoogleUser?) -> Void {
        eventsService.createEvent(for: user)
    }
}
