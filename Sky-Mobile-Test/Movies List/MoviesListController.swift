//
//  MoviesListController.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 7/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import UIKit

class MoviesListController: UIViewController {
    
    var movieItems = [MovieItem]()
    let networkmanager = NetworkManager(session: URLSession.shared)
    let cellId = "MovieItemCollectionViewCell"
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var GreetingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = "Cine SKY"
        GreetingsLabel.text = "Uma seleção de filmes imperdíveis:"
        fetchData()
    }
    
    private func fetchData() {
        networkmanager.fetchData(fromEndPoint: .home) { (result) in
            switch result {
            case .success(let moviesData):
                self.decodeData(data: moviesData, toFormat: [MovieItem].self)
            case .failure(_):
                print()
            }
        }
    }
    
    private func decodeData<T: Codable>(data: Data, toFormat format: T.Type) {
        let decoder = JSONDecoder()
        if let decodedData = try? decoder.decode(format, from: data) {
            guard let movies = decodedData as? [MovieItem] else { return }
            movieItems = movies
            moviesCollectionView.reloadData()
        }
    }
}

extension MoviesListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MovieItemCollectionViewCell else { return MovieItemCollectionViewCell() }
        let movieData = movieItems[indexPath.row]
        let moviesListVM = MoviesListViewModel(movieItem: movieData)
        cell.formatUI(forMovieListViewModel: moviesListVM)
        return cell
    }
}

extension MoviesListController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension MoviesListController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 180, height: 300)
    }
}
