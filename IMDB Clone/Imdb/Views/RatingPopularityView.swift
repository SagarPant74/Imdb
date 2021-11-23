//
//  RatingPopularityView.swift
//  IMDB Clone
//
//  Created by Sagar Pant on 30/10/21.
//

import Foundation
import UIKit

class RatingPopularityView: UIView {

    private lazy var imageView: UIImageView = {
       let movieImageView = UIImageView()
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.layer.cornerRadius = 32
        movieImageView.layer.masksToBounds = true
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.layer.masksToBounds = true
        return movieImageView
    }()
    
    
    private lazy var mainStackView: UIStackView = {
       let mainStackView = UIStackView(arrangedSubviews: [
        imageView,
        ratingPopularityStackView
       ])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.spacing = 24
        mainStackView.axis = .horizontal
        return mainStackView
    }()
    
    
    private lazy var ratingPopularityStackView: UIStackView = {
        let ratingPopularityStackView = UIStackView(arrangedSubviews: [topSpacer,
                                                                       releaseDateView,
                                                                       ratingView,
                                                                       popularityView,
                                                                       bottomSpacer
        ])
        ratingPopularityStackView.translatesAutoresizingMaskIntoConstraints = false
        ratingPopularityStackView.spacing = 24
        ratingPopularityStackView.isLayoutMarginsRelativeArrangement = true
        ratingPopularityStackView.axis = .vertical
        ratingPopularityStackView.alignment = .leading
        ratingPopularityStackView.distribution = .fill
        return ratingPopularityStackView
    }()
    
    private lazy var releaseDateView: TitleSubtitleView = {
        let releaseDateView = TitleSubtitleView()
        releaseDateView.translatesAutoresizingMaskIntoConstraints = false
        return releaseDateView
    }()
    
    private lazy var ratingView: TitleSubtitleView = {
        let ratingView = TitleSubtitleView()
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        return ratingView
    }()
    
    private lazy var popularityView: TitleSubtitleView = {
       let popularityView = TitleSubtitleView()
        popularityView.translatesAutoresizingMaskIntoConstraints = false
        return popularityView
    }()
    
    private lazy var topSpacer: UIView = {
       let topSpacer = UIView()
        topSpacer.translatesAutoresizingMaskIntoConstraints = false
        return topSpacer
    }()

    private lazy var bottomSpacer: UIView = {
        let bottomSpacer = UIView()
        bottomSpacer.translatesAutoresizingMaskIntoConstraints = false
        return bottomSpacer
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(mainStackView)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate(staticConstraints())
        super.updateConstraints()
    }
    
    private func staticConstraints() -> [NSLayoutConstraint] {
        return [
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topSpacer.heightAnchor.constraint(equalTo: bottomSpacer.heightAnchor),
            ratingView.heightAnchor.constraint(equalTo: popularityView.heightAnchor),
            popularityView.heightAnchor.constraint(equalTo: releaseDateView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ]
    }
    
    struct ViewData {
        let releaseDate: String
        let rating: Float
        let popularity: Float
        let movieImage: UIImage?
    }
    
    var viewData: ViewData? {
        didSet {
            render()
        }
    }
    
    private func render() {
        guard let viewData = viewData else {
            return
        }
        
        let releaseDate = NSAttributedString(string: viewData.releaseDate,
                                             attributes: [.foregroundColor: UIColor.darkGray,
                                                          .font: UIFont.preferredFont(forTextStyle: .subheadline)])
        
        let releaseDateTitle = NSAttributedString(string: "Release Date",
                                                  attributes: [.foregroundColor: UIColor.gray,
                                                               .font: UIFont.preferredFont(forTextStyle: .headline)])
        
        releaseDateView.viewData = TitleSubtitleView.ViewData(title: releaseDateTitle,
                                                              subtitle: releaseDate)
        let rating = NSMutableAttributedString(string: "⭐️ Rating")
        rating.addAttributes([.foregroundColor: UIColor.gray,
                              .font: UIFont.preferredFont(forTextStyle: .headline)],
                             range: NSMakeRange(2, rating.length - 2))
        let ratingSubtitle = NSAttributedString(string: String(viewData.rating),
                                                attributes: [.foregroundColor: UIColor.darkGray,
                                                             .font: UIFont.preferredFont(forTextStyle: .subheadline)])
        
        ratingView.viewData = TitleSubtitleView.ViewData(title: rating, subtitle: ratingSubtitle)
        
        
        let popularity = NSMutableAttributedString(string: "❤️ Popularity")
        popularity.addAttributes([.foregroundColor: UIColor.gray,
                                  .font: UIFont.preferredFont(forTextStyle: .headline)],
                                 range: NSMakeRange(2, popularity.length - 2))
        
        let popularitySubtitle = NSAttributedString(string: String(viewData.popularity),
                                                    attributes: [.foregroundColor: UIColor.darkGray,
                                                                 .font: UIFont.preferredFont(forTextStyle: .subheadline)])
        
        popularityView.viewData = TitleSubtitleView.ViewData(title: popularity,
                                                             subtitle: popularitySubtitle)
        
        imageView.image = viewData.movieImage
    }
}


class TitleSubtitleView: UIView {
    private lazy var titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
       let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    private lazy var mainStackView: UIStackView = {
       let mainStackView = UIStackView(arrangedSubviews: [
        titleLabel,
        subtitleLabel
       ])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.axis = .vertical
        mainStackView.spacing = 8
        mainStackView.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        mainStackView.distribution = .fillEqually
        return mainStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        addSubview(mainStackView)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate(staticConstraints())
        super.updateConstraints()
    }
    
    private func staticConstraints() -> [NSLayoutConstraint] {
        return [
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
    }
    
    struct ViewData {
        let title: NSAttributedString
        let subtitle: NSAttributedString
    }
    
    var viewData: ViewData? {
        didSet{
            render()
        }
    }
    
    private func render() {
        guard let viewData = viewData else {
            return
        }
        titleLabel.attributedText = viewData.title
        subtitleLabel.attributedText = viewData.subtitle
    }
}
