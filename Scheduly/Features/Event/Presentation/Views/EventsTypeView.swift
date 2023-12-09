//
//  EventsView.swift
//  Scheduly
//
//  Created by cefalo on 29/11/23.
//

import SwiftUI


struct EventsTypeView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    let eventsViewModel = EventsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                
            }
        }.navigationTitle("Events")
            .onAppear {
                eventsViewModel.fetchEvents(for: authViewModel.user)
            }
    }
}

struct EventsTypeView_Previews: PreviewProvider {
    static var previews: some View {
        EventsTypeView()
    }
}
