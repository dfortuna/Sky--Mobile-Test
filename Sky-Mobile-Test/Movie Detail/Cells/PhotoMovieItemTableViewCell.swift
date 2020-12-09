//
//  PhotoMovieItemTableViewCell.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 9/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import UIKit

class PhotoMovieItemTableViewCell: UITableViewCell {

    @IBOutlet weak var movieBanner: UIImageView!
    
    func formatUI(forImage imageURL: String) {
        movieBanner.load(urlString: imageURL) { _ in }
    }
}
