//
//  MoviesListViewModel2_tests.swift
//  Sky-Mobile-TestTests
//
//  Created by Denis Fortuna on 9/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import XCTest
@testable import Sky_Mobile_Test

class MoviesListViewModel2_tests: XCTestCase {

    func test_validade_movieList_viewModel() {
        let movieItemm = MovieItem(title: "Doutor Estranho",
                                  overview: "Stephen Strange (Benedict Cumberbatch) leva...",
                                  duration: "1h 55m",
                                  release_year: "2017",
                                  cover_url: "https://image.tmdb.org/t/p/w1280/dsAQmTOCyMDgmiPp9J4aZTvvOJP.jpg",
                                  backdrops_url: ["https://image.tmdb.org/t/p/w1280/dsAQmTOCyMDgmiPp9J4aZTvvOJP.jpg"],
                                  id: "090f0d8fs9d0dfdf")
        
        let viewModel = MoviesListViewModel(movieItem: movieItemm)
        
        XCTAssertEqual(viewModel.title, movieItemm.title)
        XCTAssertEqual(viewModel.cover_url, movieItemm.cover_url)
    }

}
