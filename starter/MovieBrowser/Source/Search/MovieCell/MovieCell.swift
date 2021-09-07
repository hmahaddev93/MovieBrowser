//
//  MovieCell.swift
//  MovieBrowser
//
//  Created by Khateeb H. on 9/6/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var movie: Movie! {
        didSet {
            self.titleLabel.text = movie.title
            self.scoreLabel.text = String(format: "%.01f", movie.voteAverage)
            self.dateLabel.text = movie.releaseDate.formatted
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
