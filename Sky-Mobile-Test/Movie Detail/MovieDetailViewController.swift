//
//  MovieDetailViewController.swift
//  Sky-Mobile-Test
//
//  Created by Denis Fortuna on 9/12/20.
//  Copyright © 2020 Denis Fortuna. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    let cells = ["PhotoMovieItemTableViewCell", "InfoMovieItemTableViewCell", "DescriptionMovieItemTableViewCell"]
    var movieItem: MovieItem?
    @IBOutlet weak var detailTableViewController: UITableView!
    
    fileprivate func setupTableView() {
        detailTableViewController.dataSource = self
        detailTableViewController.delegate = self
        detailTableViewController.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = Colors.background.color
        detailTableViewController.backgroundColor = Colors.background.color
        detailTableViewController.reloadData()
    }
    
    func setup(forMovieItem movie: MovieItem) {
        self.movieItem = movie
    }
}

extension MovieDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieItem = movieItem else { return UITableViewCell() }
        
        let cellID = cells[indexPath.row]
        switch cellID {
        case "PhotoMovieItemTableViewCell":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? PhotoMovieItemTableViewCell else {
                return UITableViewCell()
            }
            cell.formatUI(forImage: movieItem.cover_url)
            return cell
            
        case "InfoMovieItemTableViewCell":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? InfoMovieItemTableViewCell else {
                return UITableViewCell()
            }
            let infoVM = MovieInfoViewModel(movieItem: movieItem)
            cell.formatUI(infoData: infoVM)
            return cell
        
        case "DescriptionMovieItemTableViewCell":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? DescriptionMovieItemTableViewCell else {
                return UITableViewCell()
            }
            cell.formatUI(description: movieItem.overview)
            return cell
            
        default:
            break
        }
        return UITableViewCell()
    }
}

extension MovieDetailViewController: UITableViewDelegate { }
