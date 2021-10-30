//
//  DataRepositoryImpl.swift
//  PhonePeImdb
//
//  Created by Sagar Pant on 30/10/21.
//

import Foundation

class DataRepositoryImpl: DataRepository {
    private let localDataHelper: LocalDataHelper
    
    init(localDataHelper: LocalDataHelper) {
        self.localDataHelper = localDataHelper
    }
    
    func getMovieList() -> [Movie] {
        return localDataHelper.getLocalMovieList()
    }
}
