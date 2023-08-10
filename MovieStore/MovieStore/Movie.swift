//
//  Movie.swift
//  MovieStore
//
//  Created by 주진형 on 2023/08/07.
//

import Foundation

struct Movie: Identifiable, Codable {
    var id: String
    var movieName: String
    var movieImageString: String
    var filmDirector: String
    var genre: String
    var star: Int
    var CGVUrl: String
    var lotteCinemaUrl: String
    var megaboxUrl: String
}
