//
//  DataRepository.swift
//  IMDB Clone
//
//  Created by Sagar Pant on 30/10/21.
//

import Foundation

protocol DataRepository {
    func getMovieList() -> [Movie]
}
