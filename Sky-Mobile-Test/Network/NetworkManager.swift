//
//  NetworkManager.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 7/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private let session: NetworkSessionProtocol
    
    init(session: NetworkSessionProtocol ) {
        self.session = session
    }
    
    func fetchData(fromEndPoint endPoint: EndPoints,
                   callback: @escaping (Result<Data, NetworkError>) -> Void) {
        
        session.fetchData(fromUrl: endPoint) { (data, response, error) in
            if error != nil {
                callback(.failure(.somethingWentWrong))
            }
            
            if let httpResponse = response as? HTTPURLResponse, let data = data {
                DispatchQueue.main.async {
                    switch httpResponse.statusCode {
                    case 200...299:
                        //success:
                        callback(.success(data))
                        
                    case 300...499:
                        //redirection messages(300...399) and client error(400...499)
                        //data has been moved to another server or wrong request
                        callback(.failure(.dataNotFound))
                        
                    case 500...599:
                        //server issues
                        callback(.failure(.serverUnavailable))
                        
                    default:
                        //something else went wrong
                        callback(.failure(.somethingWentWrong))
                    }   
                }
            }
        }
    }
    
    func decode<T: Codable>(data: Data, format: T.Type) {
        
    }
}
