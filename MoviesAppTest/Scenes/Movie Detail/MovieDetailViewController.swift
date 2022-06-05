//
//  MovieDetailViewController.swift
//  MoviesAppTest
//
//  Created by chaouki bencherif on 5/6/2022.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!

    // MARK: Properties

    private var viewModel: MovieDetailViewModel!

    // MARK: Init

    static func create(viewModel: MovieDetailViewModel) -> MovieDetailViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: Local helpers

    private func setupUI() {
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/original" + viewModel.movieImage) {
            self.movieImage.kf.setImage(with: imageURL, placeholder: UIImage(named: "movie"))
        }
        movieTitleLabel.text = viewModel.movieTitle
        movieYearLabel.text = viewModel.movieDate
        movieDescriptionLabel.text = viewModel.movieDescription
    }

}
