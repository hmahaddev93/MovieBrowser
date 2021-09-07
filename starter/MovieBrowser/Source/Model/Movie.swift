//
//  Movie.swift
//  Movie Browser
//
//  Created by Khateeb Mahad H. on 7/18/21.
//

import Foundation

struct Movie: Codable {
    let title: String
    let overview: String
    let posterPath: String?
    let voteAverage: Double
    let releaseDate: Date
}
