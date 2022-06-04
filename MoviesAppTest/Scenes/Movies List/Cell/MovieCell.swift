//
//  MovieCell.swift
//  MoviesAppTest
//
//  Created by chaouki bencherif on 4/6/2022.
//

import UIKit

class MovieCell: UITableViewCell {

    // MARK: - Constants

    static let identifier = "MovieCell"

    // MARK: - Outlets

    @IBOutlet weak var movieIcon: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!

    // MARK: - Configure

    func configure(icon: String, title: String, year: String) {
        movieIcon.image = UIImage(named: icon)
        movieTitleLabel.text = title
        movieYearLabel.text = year
    }
}
