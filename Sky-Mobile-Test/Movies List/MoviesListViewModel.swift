//
//  MoviesListViewModel.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 8/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import Foundation

class MoviesListViewModel {
    
    fileprivate(set) var title: String
    fileprivate(set) var cover_url: String
    
    init(movieItem: MovieItem) {
        self.title = movieItem.title
        self.cover_url = movieItem.cover_url
    }
}
