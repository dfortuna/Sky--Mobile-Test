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
                        callback(.success(data))
                    default:
                        callback(.failure(.somethingWentWrong))
                    }
                }
            }
        }
    }
    
    func decode<T: Codable>(data: Data, format: T.Type) {
        
    }
}
