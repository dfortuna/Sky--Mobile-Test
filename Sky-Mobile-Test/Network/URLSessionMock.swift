//
//  URLSessionMock.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 8/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation

class URLSessionMock: NetworkSessionProtocol {
    
    var data: Data?
    var error: Error?
    var response: URLResponse?
    
    func fetchData(fromUrl url: EndPoints, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
        callback(data, response, error)
    }
}
