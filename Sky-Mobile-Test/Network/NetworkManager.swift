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
    
    func fetchData<T: Codable>(fromEndPoint endPoint: EndPoints,
                               andFormat format: T.Type,
                   callback: @escaping (Result<[T], NetworkError>) -> Void) {
        session.fetchData(fromUrl: endPoint) { (data, response, error) in
            if error != nil {
                callback(.failure(.somethingWentWrong))
            }
            
            if let httpResponse = response as? HTTPURLResponse, let data = data {
                switch httpResponse.statusCode {
                case 200...299:
                    let decoder = JSONDecoder()
                    if let decodedData = try? decoder.decode([T].self, from: data) {
                        callback(.success(decodedData))
                    }
                default:
                    callback(.failure(.somethingWentWrong))
                }
            }
        }
    }
}
