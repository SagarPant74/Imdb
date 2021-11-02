//
//  MovieDetailViewController.swift
//  IMDB Clone
//
//  Created by Sagar Pant on 30/10/21.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    private let viewModel: MovieDetailViewModelType
    
    init(viewModel: MovieDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not Implemented")
    }
    
    private lazy var ratingPopularityView: RatingPopularityView = {
       let ratingPopularityView = RatingPopularityView()
        ratingPopularityView.translatesAutoresizingMaskIntoConstraints = false
        return ratingPopularityView
    }()
    
    private lazy var movieOverViewStackView: UIStackView = {
        let movieOverViewStackView = UIStackView(arrangedSubviews: [
            overviewLabel,
            overviewSubLabel
        ])
        movieOverViewStackView.translatesAutoresizingMaskIntoConstraints = false
        movieOverViewStackView.axis = .vertical
        movieOverViewStackView.distribution = .fill
        movieOverViewStackView.spacing = 16
        return movieOverViewStackView
    }()
    
    private lazy var overviewLabel: UILabel = {
       let overviewLabel = UILabel()
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        overviewLabel.textColor = .lightGray
        overviewLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return overviewLabel
    }()
    
    private lazy var bottomSpacer: UIView = {
       let bottomSpacer = UIView()
        bottomSpacer.translatesAutoresizingMaskIntoConstraints = false
        bottomSpacer.setContentHuggingPriority(.defaultLow, for: .vertical)
        return bottomSpacer
    }()
    
    private lazy var overviewSubLabel: UILabel = {
        let overviewSubLabel = UILabel()
        overviewSubLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewSubLabel.font = UIFont.preferredFont(forTextStyle: .body)
        overviewSubLabel.textColor = .gray
        overviewSubLabel.numberOfLines = 0
        return overviewSubLabel
    }()

    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView(arrangedSubviews: [
            ratingPopularityView,
            movieOverViewStackView,
            bottomSpacer
        ])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.insetsLayoutMarginsFromSafeArea = true
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 32, left: 16, bottom: 16, right: 16)
        mainStackView.spacing = 40
        return mainStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        view.setNeedsUpdateConstraints()
        view.layoutIfNeeded()
        render()
    }
    
    override func updateViewConstraints() {
        NSLayoutConstraint.activate(staticConstraints())
        super.updateViewConstraints()
    }
    
    private func staticConstraints() -> [NSLayoutConstraint] {
        return [
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ratingPopularityView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ]
    }
    
    private func render() {
        viewModel.getMovieDetails(completion: { [weak self] ratingPopularityViewData in
            guard let ratingPopularityViewData = ratingPopularityViewData else {
                return
            }
            self?.ratingPopularityView.viewData = ratingPopularityViewData
        })
        
        let (movieTitle, movieSubtitle) = viewModel.getMovieTitleSubtitle()
        navigationItem.title = movieTitle
        overviewLabel.text = movieTitle
        overviewSubLabel.text = movieSubtitle
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

