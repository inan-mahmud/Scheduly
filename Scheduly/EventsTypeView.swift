//
//  EventsView.swift
//  Scheduly
//
//  Created by cefalo on 29/11/23.
//

import SwiftUI

struct EventsTypeView: View {
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                EventService().fetchEvents { result in
                    switch result {
                    case .success(let event):
                        print(event.summary)
                    case .failure(let error):
                        print("Event Error \(error)")
                    }
                }
            }
        
    }
}

struct EventsTypeView_Previews: PreviewProvider {
    static var previews: some View {
        EventsTypeView()
    }
}
