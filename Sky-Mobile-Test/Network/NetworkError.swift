//
//  NetworkError.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 7/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
    case somethingWentWrong
}

extension NetworkError: CustomStringConvertible {
    var description: String {
        switch self {
        case .somethingWentWrong:
            return "Something went wrong! Please, try again later"
        }
    }
}
