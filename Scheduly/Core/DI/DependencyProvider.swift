//
//  DependencyProvider.swift
//  Scheduly
//
//  Created by cefalo on 16/12/23.
//

import Foundation

struct DependencyProvider {
    
    static var authService: AuthService {
        return AuthService()
    }
    
    static var authViewModel: AuthViewModel {
        return AuthViewModel(service: authService)
    }
    
    static var eventService: EventService {
        return EventService()
    }
    
    static var eventViewModel: EventsViewModel {
        return EventsViewModel(service: eventService)
    }
}
