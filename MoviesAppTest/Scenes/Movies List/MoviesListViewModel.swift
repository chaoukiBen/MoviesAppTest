//
//  MoviesListViewModel.swift
//  MoviesAppTest
//
//  Created by chaouki bencherif on 3/6/2022.
//

import Foundation

class MoviesListViewModel {

    // MARK: - Properties

    var movies: [Movie]?

    // MARK: - Interfaces

    func movieAtIndex(index: Int) -> Movie? {
        return movies?[index]
    }
}

extension MoviesListViewModel {

    func fetchData(success: @escaping (Bool)->Void, fail: @escaping (String)->Void) {

        NetworkService.fetchData { movies in
            if movies.count > 0 {
                self.movies = movies
                success(true)
            } else {
                success(false)
            }
        } fail: { error in
            fail(error)
        }
    }
}
