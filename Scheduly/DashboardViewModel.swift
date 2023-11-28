//
//  DashboardViewModel.swift
//  Scheduly
//
//  Created by cefalo on 28/11/23.
//

import Foundation
import GoogleAPIClientForREST_Calendar
import GoogleAPIClientForRESTCore
import GoogleSignIn
import GTMSessionFetcherFull


final class DashboardViewModel: ObservableObject {
    
    private let httpClient: HTTPClient
    
    init() {
        
    }
    
    private func getData() {
       
        
        httpClient.makeRequest(request: <#T##URLRequest#>, completion: <#T##(Result<(Data, HTTPURLResponse), Error>) -> Void#>)
        
    }
}

