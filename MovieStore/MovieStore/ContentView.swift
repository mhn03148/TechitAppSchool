//
//  ContentView.swift
//  MovieStore
//
//  Created by 주진형 on 2023/08/07.
//https://www.lottecinema.co.kr/NLCHS/ticketing?movieCd=20031&movieName=%EC%98%A4%ED%8E%9C%ED%95%98%EC%9D%B4%EB%A8%B8

import SwiftUI

struct ContentView: View {
    @ObservedObject var movieStore: MovieStore = MovieStore()
    @Binding var isShowing: Bool
    var body: some View {
        NavigationStack {
            Form {
                ForEach(movieStore.Movies){ movie in
                    Section(header: Text("\(movie.movieName)")){
                        HStack {
                            Spacer()
                            VStack(){
                                Text("감독: \(movie.filmDirector)")
                                Text("장르: \(movie.genre)")
                                MovieStarView(movieStore: MovieStore(), movie: movie)
                                Spacer()
                                AsyncImage(url: URL(string: movie.movieImageString)) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:200)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            Spacer()
                        }
                    }
                    Section(header:Text("\(movie.movieName)의 예매페이지")) {
                        NavigationLink(destination: CGVSafariView(movie: movie)) {
                            Image("CGV")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 50)
                                .padding()
                        }
                        NavigationLink(destination: LotteCinemaSafariView(movie: movie)) {
                            Image("lottecinema")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 90)
                                .padding()
                        }
                        NavigationLink(destination: MegaBoxSafariView(movie: movie)) {
                            Image("Megabox")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 90)
                                .padding()
                        }
                    }
                }
            }
            .formStyle(.grouped)
            .navigationTitle("🎬MyMovieStore")
            .refreshable {
                Task {
                    await movieStore.fetchProducts()
                }
            }
            .onAppear {
                Task {
                    await movieStore.fetchProducts()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movieStore: MovieStore(), isShowing: .constant(false))
    }
}
