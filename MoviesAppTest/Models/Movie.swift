//
//  Movie.swift
//  MoviesAppTest
//
//  Created by chaouki bencherif on 3/6/2022.
//

import Foundation

struct Movie: Codable {
    let title: String
    let original_title: String
    let release_date: String
    let overview: String
    let poster_path: String?
}

struct Movies: Codable {
    let results: [Movie]
}
