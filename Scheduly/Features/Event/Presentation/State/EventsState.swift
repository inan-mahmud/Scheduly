//
//  EventsState.swift
//  Scheduly
//
//  Created by cefalo on 9/12/23.
//

import Foundation
import GoogleAPIClientForRESTCore
import GoogleAPIClientForREST_Calendar

enum EventsState {
    case loading
    case data([GTLRCalendar_Event])
    case error(String)
}
