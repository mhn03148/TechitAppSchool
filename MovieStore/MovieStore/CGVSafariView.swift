//
//  SwiftUIView.swift
//  MovieStore
//
//  Created by 주진형 on 2023/08/07.
//

import SwiftUI
import SafariServices

struct CGVSafariView: View {
    var movie: Movie
    var body: some View{
        NavigationStack {
            SafariViewCGV(movie: movie)
        }
        .navigationTitle(movie.movieName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SafariViewCGV: UIViewControllerRepresentable {
    var movie: Movie
    func makeUIViewController(context: Context) -> some UIViewController {
        SFSafariViewController(url: URL(string: movie.CGVUrl)!)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // ...
    }
}

struct MovieBookView_Previews: PreviewProvider {
    static var previews: some View {
        CGVSafariView(movie: Movie(id: "", movieName: "", movieImageString: "", filmDirector: "", genre:"", star: 0, CGVUrl: "https://moviestory.cgv.co.kr/fanpage/mainView?movieIdx=87175", lotteCinemaUrl: "", megaboxUrl: ""))
    }
}
