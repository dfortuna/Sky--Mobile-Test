//
//  URLSession + Extensions.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 8/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation

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
