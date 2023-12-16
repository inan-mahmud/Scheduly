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
    
    @StateObject var eventsViewModel = DependencyProvider.eventViewModel
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
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
                    
                    Spacer()
                    
                    Button(action: {
                        eventsViewModel.showSheet.toggle()
                    }) {
                         Text("Create an Event")
                           .padding()
                           .foregroundColor(.white)
                           .background(.blue)
                           .cornerRadius(100)
                       }
                    .sheet(isPresented: $eventsViewModel.showSheet) {
                        SheetView()
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


struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var eventsViewModel: EventsViewModel
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var date = Date.now

    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment:.leading) {
                    
                    DatePicker("Event Start Date", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxHeight: 200)
                    
                    
                    Button(action: {
                        dismiss()
                    })
                    {
                        Text("Close")
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(100)
                    }
                }
            }
        }
    }
}
