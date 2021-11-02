//
//  MovieDetailViewModel.swift
//  IMDB Clone
//
//  Created by Sagar Pant on 30/10/21.
//

import Foundation
import UIKit

protocol MovieDetailViewModelType {
    func getMovieDetails(completion: @escaping (RatingPopularityView.ViewData?) -> Void)
    func getMovieTitleSubtitle() -> (String, String)
}

class MovieDetailViewModel: MovieDetailViewModelType {
    private static let path = "https://image.tmdb.org/t/p/w500"
    private let movie: Movie
    init(movie: Movie) {
        self.movie = movie
    }
    
    func getMovieDetails(completion: @escaping (RatingPopularityView.ViewData?) -> Void) {
        getMovieImage { [weak self] image in
            guard let self = self else {
                completion(nil)
                return
            }
            
            completion(RatingPopularityView.ViewData(releaseDate: self.movie.releaseDate,
                                                     rating: self.movie.voteAverage,
                                                     popularity: self.movie.popularity,
                                                     movieImage: image))
        }
    }
    
    func getMovieImage(completion: @escaping (UIImage?) -> Void) {
        let movieURLString = MovieDetailViewModel.path + movie.posterPath
        guard let movieURL = URL(string: movieURLString) else {
            completion(nil)
                  return
        }
        let urlRequest = URLRequest(url: movieURL)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completion(nil)
                } else {
                    guard let data = data else {
                        completion(nil)
                        return
                    }
                    let image = UIImage(data: data)
                    completion(image)
                }
            }
        }
        task.resume()
    }
    
    func getMovieTitleSubtitle() -> (String, String) {
        (movie.title, movie.overview)
    }
}
