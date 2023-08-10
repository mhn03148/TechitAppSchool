//
//  LotteCinemaSafariView.swift
//  MovieStore
//
//  Created by 주진형 on 2023/08/07.
//

import SwiftUI
import SafariServices

struct LotteCinemaSafariView: View {
    var movie: Movie
    var body: some View{
        NavigationStack {
            SafariViewLotte(movie: movie)
        }
        .navigationTitle(movie.movieName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct SafariViewLotte: UIViewControllerRepresentable {
    var movie: Movie

    func makeUIViewController(context: Context) -> some UIViewController {
        SFSafariViewController(url: URL(string: movie.lotteCinemaUrl)!)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // ...
    }
        
}


struct LotteCinemaSafariView_Previews: PreviewProvider {
    static var previews: some View {
        LotteCinemaSafariView( movie: Movie(id: "", movieName: "", movieImageString: "", filmDirector: "", genre:"", star: 0, CGVUrl: "", lotteCinemaUrl: "https://www.lottecinema.co.kr/NLCHS/ticketing?movieCd=20031&movieName=%EC%98%A4%ED%8E%9C%ED%95%98%EC%9D%B4%EB%A8%B8", megaboxUrl: ""))
    }
}
