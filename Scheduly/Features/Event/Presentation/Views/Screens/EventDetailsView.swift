//
//  EventDetailsView.swift
//  Scheduly
//
//  Created by cefalo on 10/12/23.
//

import SwiftUI
import GoogleAPIClientForRESTCore
import GoogleAPIClientForREST_Calendar

struct EventDetailsView: View {
    
    let event: GTLRCalendar_Event
    @State private var attendees: [GTLRCalendar_EventAttendee] = []
    
    init(event: GTLRCalendar_Event) {
        self.event = event
    }
    
    var body: some View {
        VStack(alignment:.leading) {
            if attendees.isEmpty {
                Text("No member")
            } else {
                VStack (alignment:.leading) {
                    Text("Attendees")
                        .font(.title2)
                        .padding(.top,16)
                        .padding(.leading,16)
                        .padding(.bottom,0)
                    List {
                        ForEach(attendees,id: \.self) { attendee in
                            VStack (alignment:.leading) {
                                Text(attendee.email ?? "")
                                Text(attendee.responseStatus ?? "Need Action")
                            }
                        }
                    }
                }
            }
        }.navigationTitle("Event Details")
            .onAppear {
                attendees = event.attendees ?? []
            }
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(event:GTLRCalendar_Event())
    }
}
