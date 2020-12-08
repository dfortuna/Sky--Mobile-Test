//
//  NetworkSessionProtocol.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 8/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation

protocol NetworkSessionProtocol {
    func fetchData(fromUrl url: EndPoints, callback: @escaping (Data?, URLResponse?, Error?) -> Void)
}
