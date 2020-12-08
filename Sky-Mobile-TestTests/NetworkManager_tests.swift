//
//  NetworkManager_tests.swift
//  Sky-Mobile-TestTests
//
//  Created by Denis Fortuna on 7/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import XCTest
@testable import Sky_Mobile_Test

class NetworkManager_tests: XCTestCase {

    func test_fetch_results_success_return() {
        
        //setup session
        let session = URLSessionMock()
        let networkManager = NetworkManager(session: session)
        
        //setup test data
        let data = Data()
        session.data = data
        
        //setup response
        let testURL = URL(string: "test")!
        let response = HTTPURLResponse(url: testURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        session.response = response
        
        networkManager.fetchData(fromEndPoint: .home) { result in
                XCTAssertEqual(result, Result.success(data))
        }
    }
    
    
    func test_fetch_results_unknownError(){
        
        //setup session
        let session = URLSessionMock()
        let networkManager = NetworkManager(session: session)
        
        //setup test data
        let data = Data()
        session.data = data
        
        //setup response
        let testURL = URL(string: "test")!
        let response = HTTPURLResponse(url: testURL, statusCode: 300, httpVersion: nil, headerFields: nil)
        session.response = response
        
        networkManager.fetchData(fromEndPoint: .home) { result in
            XCTAssertEqual(result, Result.failure(.somethingWentWrong))
        }
    }

}
