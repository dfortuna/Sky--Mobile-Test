//
//  MovieItem_tests.swift
//  Sky-Mobile-TestTests
//
//  Created by Denis Fortuna on 8/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import XCTest
@testable import Sky_Mobile_Test

class MovieItem_tests: XCTestCase {

    func test_JSON_mapping() throws {
        
        let decoder = JSONDecoder()
        
        guard let url = Bundle.main.url(forResource: "MoviesList", withExtension: "json"),
              let jsonData = try? Data(contentsOf: url),
              let movieItem = try? decoder.decode([MovieItem].self, from: jsonData)
        else {
            XCTFail("Missing MoviesList.json")
            return
        }
        XCTAssertEqual(movieItem[0].id, "090f0d8fs9d0dfdf")
        XCTAssertEqual(movieItem[0].title, "Doutor Estranho")
    }
}
