//
//  MovieListCell.swift
//  PhonePeImdb
//
//  Created by Sagar Pant on 30/10/21.
//

import UIKit

class MovieListCell: UITableViewCell {
    static let reuseIdentifier = "com.example.movieListCell"
    
    private lazy var movieImageView: UIImageView = {
        let movieImageView = UIImageView()
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.layer.cornerRadius = 8
        movieImageView.contentMode = .scaleAspectFit
        movieImageView.clipsToBounds = true
        movieImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return movieImageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView(arrangedSubviews: [
            movieImageView,
            titleSubtitleStackView
        ])
        mainStackView.axis = .horizontal
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.spacing = 8
        mainStackView.distribution = .fill
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right:16)
        return mainStackView
    }()
    
    private lazy var titleSubtitleStackView: UIStackView = {
        let titleSubtitleStackView = UIStackView(arrangedSubviews: [ titleLabel,
                                                                     subtitle
                                                                   ])
        titleSubtitleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleSubtitleStackView.axis = .vertical
        titleSubtitleStackView.spacing = 8
        titleSubtitleStackView.isLayoutMarginsRelativeArrangement = true
        titleSubtitleStackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        titleSubtitleStackView.distribution = .fill
        return titleSubtitleStackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        return titleLabel
    }()
    
    private lazy var subtitle: UILabel = {
       let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.numberOfLines = 2
        subtitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return subtitle
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    func commonInit() {
        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        setNeedsUpdateConstraints()
        layoutIfNeeded()
    }
    
    struct MovieListCellViewData {
        let image: UIImage?
        let title: String
        let subtitle: String
    }
    
    var viewData: MovieListCellViewData? {
        didSet{
            render()
        }
    }
    
    private func render() {
        guard let viewData = viewData else {
            return
        }
        movieImageView.image = viewData.image
        titleLabel.text = viewData.title
        subtitle.text = viewData.subtitle
        setNeedsLayout()
        layoutIfNeeded()
    }
}
