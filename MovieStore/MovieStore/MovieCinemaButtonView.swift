//
//  MovieCinemaButtonView.swift
//  MovieStore
//
//  Created by 주진형 on 2023/08/07.
//

import SwiftUI

struct MovieCinemaButtonView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    MovieBookView()
                } label: {
                    Image("CGV")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 50)
                        .padding()
                }
                
                NavigationLink {
                    LotteCinemaSafariView()
                } label: {
                    Image("lottecinema")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 90)
                        .padding()
                }
                
                Button {
                    print("Megabox")
                } label: {
                    Image("Megabox")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 90)
                        .padding()
                }
            }
        }
    }
}

struct MovieCinemaButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCinemaButtonView()
    }
}
