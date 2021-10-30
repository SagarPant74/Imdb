//
//  Movie.swift
//  PhonePeImdb
//
//  Created by Sagar Pant on 30/10/21.
//

import Foundation

struct Movie: Decodable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
//    {
//      "adult": false,
//      "backdrop_path": "/Aebz7s8EHQXxHR98J8Vw6QVGggq.jpg",
//      "genre_ids": [
//        12,
//        18,
//        14,
//        878
//      ],
//      "id": 438631,
//      "original_language": "en",
//      "original_title": "Dune",
//      "overview": "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity's greatest potential-only those who can conquer their fear will survive.",
//      "popularity": 5531.157,
//      "poster_path": "/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
//      "release_date": "2021-09-15",
//      "title": "Dune",
//      "video": false,
//      "vote_average": 8,
//      "vote_count": 2875
//    }
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
