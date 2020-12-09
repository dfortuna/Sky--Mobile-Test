//
//  InfoMovieItemTableViewCell.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 9/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import UIKit

class MovieInfoViewModel {
    
    let movieTitle: String
    let movieDetails: String
    
    init(movieItem: MovieItem) {
        self.movieTitle = movieItem.title
        self.movieDetails = "\(movieItem.release_year) • \(movieItem.duration)"
    }
}

class InfoMovieItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDetails: UILabel!
    
    func formatUI(infoData: MovieInfoViewModel) {
        ageView.layer.cornerRadius = 5
        ageView.backgroundColor = .red
        ageLabel.textColor = .white
        
        // TODO: - Get Movie censorship
        ageLabel.text = "15"
        
        movieDetails.text = infoData.movieDetails
        movieTitle.text = infoData.movieTitle
    }
}
