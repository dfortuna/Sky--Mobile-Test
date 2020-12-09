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
    
    fileprivate func formatUI() {
        formatNavigationController()
        view.backgroundColor = Colors.background.color
        GreetingsLabel.text = "Uma seleção de filmes imperdíveis:"
        moviesCollectionView.backgroundColor = Colors.background.color
        GreetingsLabel.textColor = Colors.text.color
    }
    
    fileprivate func formatNavigationController() {
        self.navigationController?.navigationBar.barTintColor = Colors.background.color
        self.navigationController?.navigationBar.tintColor = Colors.text.color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.text.color]
        title = "Cine SKY"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func fetchData() {
        networkmanager.fetchData(fromEndPoint: .home) { (result) in
            switch result {
            case .success(let moviesData):
                self.decodeData(data: moviesData, toFormat: [MovieItem].self)
            case .failure(let error):
                Alert.call(withMessage: error.description, andTitle: nil, onViewController: self)
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
        
        let movie = movieItems[indexPath.row]
        let detailVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
        detailVC.setup(forMovieItem: movie)
    }
}

extension MoviesListController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 180, height: 300)
    }
}
