//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Authored by Khateeb Mahad H. on 9/5/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    public var movieModel: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    private func update() {
        guard let movie = movieModel else {
            return
        }
        titleLabel.text = movie.title
        releaseDateLabel.text = "Release Date: " + movie.releaseDate.formatted1
        overviewLabel.text = movie.overview
        guard let posterImagePath:String = movie.posterPath else {
            return
        }
        self.posterImageView.loadThumbnail(urlSting: MovieAPI.imageDBBaseUrl + posterImagePath)
    }
    
}
