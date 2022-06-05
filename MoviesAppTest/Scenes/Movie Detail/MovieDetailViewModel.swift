//
//  MovieDetailViewModel.swift
//  MoviesAppTest
//
//  Created by chaouki bencherif on 5/6/2022.
//

import Foundation

class MovieDetailViewModel {

    // MARK: Properties

    private(set) var movieImage: String
    private(set) var movieTitle: String
    private(set) var movieDate: String
    private(set) var movieDescription: String

    // MARK: Init

    init(movie: Movie) {
        self.movieImage = movie.poster_path ?? ""
        self.movieTitle = movie.title
        self.movieDescription = movie.overview
        self.movieDate = Utilities.getComponent(component: "yyyy",
                                                from: movie.release_date,
                                                using: "yyyy-MM-dd") ?? ""
    }
}
