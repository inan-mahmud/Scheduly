//
//  HTTPClient.swift
//  Scheduly
//
//  Created by cefalo on 28/11/23.
//

import Foundation

protocol HTTPClient {
    func makeRequest(request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}



extension URLSession: HTTPClient {
    
    struct InvalidHTTPResponseError: Error {}
    
    struct NoDataError: Error {}
    
    func makeRequest(request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        self.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(InvalidHTTPResponseError()))
                return
            }
            
            guard let data = data else {
                completion(.failure(NoDataError()))
                return
            }
            
            completion(.success((data,httpResponse)))
        }.resume()
    }
}

