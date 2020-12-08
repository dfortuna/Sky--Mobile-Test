//
//  NetworkManager.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 7/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation

protocol NetworkSessionProtocol {
    func fetchData(fromUrl url: EndPoints, callback: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: NetworkSessionProtocol {

    func fetchData(fromUrl url: EndPoints, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
        if let url = URL(string: url.rawValue) {
            let task = self.dataTask(with: url) { (data, response, error) in
                callback(data, response, error)
            }
            task.resume()
        }
    }
}


class URLSessionMock: NetworkSessionProtocol {
    
    var data: Data?
    var error: Error?
    var response: URLResponse?
    
    func fetchData(fromUrl url: EndPoints, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
        callback(data, response, error)
    }
}

class NetworkManager {
    
    private let session: NetworkSessionProtocol
    
    init(session: NetworkSessionProtocol ) {
        self.session = session
    }
    
    func fetchData(fromEndPoint endPoint: EndPoints, callback: @escaping (Result<Data, NetworkError>) -> Void) {
        session.fetchData(fromUrl: endPoint) { (data, response, error) in
            if error != nil {
                callback(.failure(.somethingWentWrong))
            }
            
            if let httpResponse = response as? HTTPURLResponse, let data = data {
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
