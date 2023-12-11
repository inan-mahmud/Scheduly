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
    
    @State private var showingSheet = false
    
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
                        showingSheet.toggle()
                    }) {
                         Text("Create an Event")
                           .padding()
                           .foregroundColor(.white)
                           .background(.blue)
                           .cornerRadius(100)
                       }
                    .sheet(isPresented: $showingSheet) {
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

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}
