//
//  MoviesListController.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 7/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import UIKit

class MoviesListController: UIViewController {
    
    let networkmanager = NetworkManager(session: URLSession.shared)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        networkmanager.fetchData(fromEndPoint: .home) { (result) in
            switch result {
            case .success(let result):
                print(String(data: result, encoding: .utf8))
            case .failure(_):
                print()
            }
        }
    }
}

