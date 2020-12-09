//
//  MovieItem.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 8/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation

struct MovieItem: Codable, Equatable {
    let title: String
    let overview: String
    let duration: String
    let release_year: String
    let cover_url: String
    let backdrops_url: [String]
    let id: String
}
