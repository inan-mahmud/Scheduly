//
//  DashboardView.swift
//  Scheduly
//
//  Created by cefalo on 27/11/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct DashboardView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        TabView {
            EventsTypeView().environmentObject(authViewModel)
                .tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("Event Types")
                }
            AvailabilityView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Availability")
                }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
