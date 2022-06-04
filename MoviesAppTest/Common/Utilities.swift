//
//  Utilities.swift
//  MoviesAppTest
//
//  Created by chaouki bencherif on 4/6/2022.
//

import Foundation

class Utilities {

    static func getComponent(component: String, from date: String, using format: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let date = formatter.date(from: date) else { return nil }
        formatter.dateFormat = component
        return formatter.string(from: date)
    }
}
