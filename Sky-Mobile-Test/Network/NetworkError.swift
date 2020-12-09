//
//  NetworkError.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 7/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case redirection         //3xx
    case invalidLogin        //401
    case dataNotFound        //404
    case serverUnavailable   //5xx
    case somethingWentWrong  //others
}

extension NetworkError: CustomStringConvertible {
    var description: String {
        switch self {
        case .redirection:
            return "Data has been redirected"
        case .invalidLogin:
            return "Invalid login credentials. Please try again."
        case .dataNotFound:
            return "Data not found!"
        case .serverUnavailable:
            return "The server is unreachable. Please, try again later"
        case .somethingWentWrong:
            return "Something went wrong! Please, try again later"
        }
    }
}
