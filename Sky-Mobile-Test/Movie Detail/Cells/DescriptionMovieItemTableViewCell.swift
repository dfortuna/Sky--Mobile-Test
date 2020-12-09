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
        backgroundColor = Colors.background.color
        movieDescription.text = description
        movieDescription.textColor = Colors.text.color
        movieDescription.backgroundColor = Colors.background.color
        movieDescription.dynamicHeight(forWidth: self.frame.width)
    }
}
