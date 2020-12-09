//
//  MovieItemCollectionViewCell.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 9/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import UIKit

class MovieItemCollectionViewCell: UICollectionViewCell {
    
    private var movieListViewModel: MoviesListViewModel?
    
    @IBOutlet weak var movieBannerImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    func formatUI(forMovieListViewModel movieData: MoviesListViewModel) {
        movieBannerImageView.layer.cornerRadius = 6
        movieBannerImageView.backgroundColor = .lightGray
        movieBannerImageView.load(urlString: movieData.cover_url) {_ in }
        movieTitle.text = movieData.title
        movieTitle.textColor = Colors.text.color
    }
}
