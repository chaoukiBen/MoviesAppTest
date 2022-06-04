//
//  MovieCell.swift
//  MoviesAppTest
//
//  Created by chaouki bencherif on 4/6/2022.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {

    // MARK: - Constants

    static let identifier = "MovieCell"

    // MARK: - Outlets

    @IBOutlet weak var movieIcon: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!

    // MARK: - Configure

    func configure(icon: String?, title: String, date: String) {
        movieTitleLabel.text = title
        movieYearLabel.text = Utilities.getComponent(component: "yyyy",
                                                     from: date,
                                                     using: "yyyy-MM-dd")
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + (icon ?? "")) {
            movieIcon.kf.setImage(with: imageURL)
        }
    }
}
