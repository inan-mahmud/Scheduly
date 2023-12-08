//
//  HTTPClient.swift
//  Scheduly
//
//  Created by cefalo on 28/11/23.
//

import Foundation

protocol HTTPClient {
    func makeRequest(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}


extension URLSession: HTTPClient {
    
    struct InvalidHTTPResponseError: Error {}
    
    struct NoDataError: Error {}
    
    func makeRequest(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        self.dataTask(with: request) { data, response, error in
            
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(InvalidHTTPResponseError()))
                return
            }
            print(response)
            guard let data = data else {
                completion(.failure(NoDataError()))
                return
            }
            completion(.success((data)))
        }.resume()
    }
}

