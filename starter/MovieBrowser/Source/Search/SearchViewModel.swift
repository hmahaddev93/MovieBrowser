//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by Khateeb H. on 9/6/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

final class SearchViewModel {
    var movies = [Movie]()
    func fetchMovies(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        MovieService().searchMovie(query: query) {[unowned self] result in
            switch result {
            case .success(let movies):
                self.movies = movies
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
