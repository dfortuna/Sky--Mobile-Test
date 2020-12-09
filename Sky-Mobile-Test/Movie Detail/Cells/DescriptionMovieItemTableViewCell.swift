//
//  DescriptionMovieItemTableViewCell.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 9/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import UIKit

class DescriptionMovieItemTableViewCell: UITableViewCell {

    @IBOutlet weak var movieDescription: UITextView!
    
    func formatUI(description: String) {
        movieDescription.text = description
    }
}
