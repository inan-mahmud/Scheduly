//
//  EventsItemView.swift
//  Scheduly
//
//  Created by cefalo on 10/12/23.
//

import SwiftUI


import GoogleAPIClientForRESTCore
import GoogleAPIClientForREST_Calendar

struct EventsItemView: View {
    
    let event: GTLRCalendar_Event
    
    init(event: GTLRCalendar_Event) {
        self.event = event
    }
    
    var body: some View {
            VStack (alignment: .leading){
                Text(event.summary ?? "")
                    .font(.title2)
                    .foregroundColor(.black)
                
                Text(event.status ?? "")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
    }
}
