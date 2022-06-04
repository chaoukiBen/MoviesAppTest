//
//  MoviesListViewController.swift
//  MoviesAppTest
//
//  Created by chaouki bencherif on 3/6/2022.
//

import UIKit

class MoviesListViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var tableView: UITableView!
    private var viewModel: MoviesListViewModel!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MoviesListViewModel()
        setupTableView()
        setupLocalization()
        viewModel.fetchData { success in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } fail: { error in print(error) }
    }

    // MARK: Local hepers

    private func setupLocalization() {
        self.title = "Movies"
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: MovieCell.identifier, bundle: nil), forCellReuseIdentifier: MovieCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
    }

}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let movie = viewModel.movieAtIndex(index: indexPath.row)  else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        cell.configure(icon: movie.poster_path, title: movie.title, date: movie.release_date)

        return cell
    }
}
