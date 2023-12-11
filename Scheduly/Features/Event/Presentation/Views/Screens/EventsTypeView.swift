//
//  EventsView.swift
//  Scheduly
//
//  Created by cefalo on 29/11/23.
//

import SwiftUI

import GoogleAPIClientForRESTCore
import GoogleAPIClientForREST_Calendar

struct EventsTypeView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var eventsViewModel = EventsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch eventsViewModel.eventsState {
                case .loading:
                    ProgressView()
                case .error(let message):
                    Text(message)
                case .data(let events):
                    List {
                        ForEach(events, id: \.self) { event in
                            NavigationLink(event.summary ?? "Unknown") {
                                EventDetailsView(event: event)
                            }
                        }
                    }
                }
            }.navigationTitle("Events")
        }.onAppear {
                eventsViewModel.fetchEvents(for: authViewModel.user)
            }
    }
}

struct EventsTypeView_Previews: PreviewProvider {
    static var previews: some View {
        EventsTypeView()
    }
}
