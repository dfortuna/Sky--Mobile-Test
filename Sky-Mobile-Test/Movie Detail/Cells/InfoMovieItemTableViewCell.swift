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
    
    fileprivate func formatTitle(_ infoData: MovieInfoViewModel) {
        movieTitle.text = infoData.movieTitle
        movieTitle.textColor = Colors.text.color
    }
    
    fileprivate func formatDetail(_ infoData: MovieInfoViewModel) {
        movieDetails.text = infoData.movieDetails
        movieDetails.textColor = Colors.text.color
    }
    
    fileprivate func formatAgeLabel() {
        // TODO: - Get Movie censorship
        ageLabel.text = "15"
        ageLabel.textColor = Colors.text.color
        ageLabel.textColor = Colors.text.color
    }
    
    fileprivate func formatAgeView() {
        ageView.layer.cornerRadius = 5
        ageView.backgroundColor = Colors.censorship.color
    }
    
    func formatUI(infoData: MovieInfoViewModel) {
        backgroundColor = Colors.background.color
        formatAgeView()
        formatAgeLabel()
        formatDetail(infoData)
        formatTitle(infoData)
    }
}
