//
//  MovieListViewController.swift
//  PhonePeImdb
//
//  Created by Sagar Pant on 30/10/21.
//

import UIKit

class MovieListViewController: UIViewController {
    private let viewModel: MovieViewModelType
    
    private lazy var movieTableView: UITableView = {
       let movieTableView = UITableView()
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        movieTableView.register(MovieListCell.self, forCellReuseIdentifier: MovieListCell.reuseIdentifier)
        movieTableView.dataSource = self
        movieTableView.delegate = self
        movieTableView.rowHeight = UITableView.automaticDimension
        movieTableView.estimatedRowHeight = 100
        return movieTableView
    }()
    
    init(viewModel: MovieViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(movieTableView)
        view.setNeedsUpdateConstraints()
        view.layoutIfNeeded()
    }
    
    override func updateViewConstraints() {
        NSLayoutConstraint.activate(staticConstraints())
        super.updateViewConstraints()
    }
    
    private func staticConstraints() -> [NSLayoutConstraint] {
        return [
            movieTableView.topAnchor.constraint(equalTo: view.topAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getMovieListCount()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell: MovieListCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.reuseIdentifier) as? MovieListCell {
            movieCell = cell
        } else {
            movieCell = MovieListCell()
        }
        let movie = viewModel.getMovieList(at: indexPath.row)
        viewModel.getMovieImage(at: indexPath.row) { image in
            movieCell.viewData = MovieListCell.MovieListCellViewData(image: image, title: movie.title, subtitle: movie.overview)
            
            movieCell.layoutIfNeeded()
        }
        let movieCellViewData = MovieListCell.MovieListCellViewData(image: nil, title: movie.title, subtitle: movie.overview)
        movieCell.viewData = movieCellViewData
        return movieCell
    }
}

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


