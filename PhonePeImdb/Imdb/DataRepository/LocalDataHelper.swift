//
//  LocalDataHelper.swift
//  PhonePeImdb
//
//  Created by Sagar Pant on 30/10/21.
//

import Foundation

protocol LocalDataHelper {
    func getLocalMovieList() -> [Movie]
}

class LocalDataHelperImp: LocalDataHelper {
    
    private let filePath: String
    private let fileExtension: String
    
    init(filePath: String = "LocalData",
         fileExtension: String = "json") {
        self.filePath = filePath
        self.fileExtension = fileExtension
    }
    
    func getLocalMovieList() -> [Movie] {
        guard let movieListData = getMovieList(),
              let movieList = try? JSONDecoder().decode([Movie].self, from: movieListData) else {
            return []
        }
        return movieList
    }
    
    private func getMovieList() -> Data? {
        guard let fileURL = Bundle.main.url(forResource: filePath, withExtension: fileExtension),
              let data = try? Data(contentsOf: fileURL),
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any],
              let movieList = dictionary["results"] as? [Any] else {
                  return nil
              }
        return try? JSONSerialization.data(withJSONObject: movieList, options: [])
    }
}
