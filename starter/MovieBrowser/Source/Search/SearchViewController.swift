//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Authored by Khateeb Mahad H. on 9/5/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    private static let reuseMovieCellIdentifier = "MovieCell"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private let viewModel: SearchViewModel = SearchViewModel()
    private let alertPresenter: AlertPresenter_Proto = AlertPresenter()
    private let navigationPresenter: NavigationPresenter_Proto = NavigationPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    private func prepareView() {
        spinner.hidesWhenStopped = true
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: type(of: self).reuseMovieCellIdentifier)
    }
    
    private func searchMovie(query: String) {
        showSpinner()
        viewModel.fetchMovies(query: query) {[unowned self] result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.hideSpinner()
                    self.update()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.hideSpinner()
                    self.display(error: error)
                }
            }
        }
    }
    
    private func update() {
        tableView.reloadData()
    }
    
    private func clear() {
        viewModel.movies.removeAll()
        self.update()
    }
    
    private func display(error: Error) {
        alertPresenter.present(from: self,
                               title: "Unexpected Error",
                               message: "\(error.localizedDescription)",
                               dismissButtonTitle: "OK")
    }
    
    private func showSpinner() {
        spinner.startAnimating()
    }
    
    private func hideSpinner() {
        spinner.stopAnimating()
    }
    
    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text, !query.replacingOccurrences(of: " ", with: "").isEmpty {
            searchMovie(query: query)
        }
        else {
            clear()
        }
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            clear()
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).reuseMovieCellIdentifier, for: indexPath) as? MovieCell {
            
            cell.movie = viewModel.movies[indexPath.row]
            
            return cell
        }
        return  UITableViewCell()
    }
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .fade)
        navigationPresenter.navigateToMovieDetail(from: self, movie: viewModel.movies[indexPath.row])
    }
}


