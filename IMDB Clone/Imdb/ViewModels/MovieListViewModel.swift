//
//  MovieListViewModel.swift
//  IMDB Clone
//
//  Created by Sagar Pant on 30/10/21.
//

import Foundation
import UIKit

protocol MovieViewModelType {
    func getMovieList(at index: Int) -> Movie
    func getMovieListCount() -> Int
    func getMovieImage(at index: Int, completion: @escaping (UIImage?) -> Void)
}

class MovieListViewModel: MovieViewModelType {
    private static let path = "https://image.tmdb.org/t/p/w500"
    let dataRepository: DataRepository
    let movieList: [Movie]
    init(dataRepository: DataRepository) {
        self.dataRepository = dataRepository
        self.movieList = dataRepository.getMovieList()
    }
    
    func getMovieList(at index: Int) -> Movie {
        return movieList[index]
    }
    
    func getMovieListCount() -> Int {
        movieList.count
    }
    
    func getMovieImage(at index: Int, completion: @escaping (UIImage?) -> Void) {
        let movieURLString = MovieListViewModel.path + movieList[index].posterPath
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
}
