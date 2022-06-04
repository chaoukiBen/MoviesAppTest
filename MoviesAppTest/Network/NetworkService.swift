//
//  NetworkService.swift
//  MoviesAppTest
//
//  Created by chaouki bencherif on 4/6/2022.
//

import Foundation

class NetworkService {

    static func fetchData(success: @escaping ([Movie])->Void, fail: @escaping (String)->Void) {

        let apiEndPoint = "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3"

        // Create your request
        guard let url = URL(string: apiEndPoint) else { return }
        let request = URLRequest(url: url)

        // Set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        // Get Data from the request
        let task = session.dataTask(with: request) { (data, response, error) in

            // Check for any errors
            guard error == nil else {
                print(error!)
                fail("Error calling server")
                return
            }

            // Make sure we've got data
            guard let responseData = data else {
                fail("Error: did not receive data")
                return
            }

            do {
                let response = try JSONDecoder().decode(Movies.self, from: responseData)
                success(response.results)
            } catch { fail(error.localizedDescription)}
        }

        task.resume()
    }
}
