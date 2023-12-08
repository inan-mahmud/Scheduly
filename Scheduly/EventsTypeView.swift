//
//  EventsView.swift
//  Scheduly
//
//  Created by cefalo on 29/11/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct EventsTypeView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                EventService().fetchEvents(for: authViewModel.user) { result  in
                    
                }
            }
        
    }
}

//struct EventsTypeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventsTypeView()
//    }
//}
