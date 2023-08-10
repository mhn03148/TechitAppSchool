//
//  MegaBoxSafariView.swift
//  MovieStore
//
//  Created by 주진형 on 2023/08/07.
//

import SwiftUI
import SafariServices

struct MegaBoxSafariView: View {
    var movie: Movie
    var body: some View{
        NavigationStack {
            SafariViewMegabox(movie: movie)
        }
        .navigationTitle(movie.movieName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct SafariViewMegabox: UIViewControllerRepresentable {
    var movie: Movie
    func makeUIViewController(context: Context) -> some UIViewController {
        SFSafariViewController(url: URL(string: movie.megaboxUrl)!)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // ...
    }
}

struct MegaBoxSafariView_Previews: PreviewProvider {
    static var previews: some View {
        MegaBoxSafariView(movie: Movie(id: "", movieName: "", movieImageString: "", filmDirector: "", genre: "", star: 2, CGVUrl: "", lotteCinemaUrl: "", megaboxUrl: "https://www.megabox.co.kr/movie-detail?rpstMovieNo=23029300"))
    }
}
