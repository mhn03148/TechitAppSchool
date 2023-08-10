//
//  MovieStarView.swift
//  MovieStore
//
//  Created by 주진형 on 2023/08/07.
//

import SwiftUI

struct MovieStarView: View {
    var movieStore: MovieStore
    var movie: Movie
    var body: some View {
        let star: Int = Int((movie.star)/2 )
        HStack {
            ForEach((1...star), id:\.self) {_ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            ForEach(1...(5-star), id: \.self) {_ in
                Image(systemName: "star")
            }
        }
    }
}

struct MovieStarView_Previews: PreviewProvider {
    static var previews: some View {
        MovieStarView(movieStore: MovieStore(), movie: Movie(id: "", movieName: "", movieImageString: "", filmDirector: "", genre: "", star: 4, CGVUrl: "", lotteCinemaUrl: "", megaboxUrl: ""))
    }
}
