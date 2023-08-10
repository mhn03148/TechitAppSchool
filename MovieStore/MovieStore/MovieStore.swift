//
//  MovieStore.swift
//  MovieStore
//
//  Created by 주진형 on 2023/08/07.
//

import Foundation
//https://mocki.io/v1/3a08d705-07ca-4cc1-b66f-cd4d9241f342
@MainActor
class MovieStore: ObservableObject {
    @Published var Movies:[Movie] = []
    @Published var fetchMessage: String = ""
    
    init() {
        
    }
    func fetchProducts() async {
        let urlString: String = "https://mocki.io/v1/3a08d705-07ca-4cc1-b66f-cd4d9241f342"
        
        guard let url = URL(string: urlString) else {
            print("Wrong URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("\(response)")
            
            let jsonString = String(data: data, encoding: .utf8)
            print("\(jsonString ?? "")")
            
            Movies = try JSONDecoder().decode([Movie].self, from: data)
            
            fetchMessage = ""
        } catch {
            debugPrint("--------")
            debugPrint("Error loading \(url):")
            debugPrint("\(String(describing: error))")
            debugPrint("--------")
            
            fetchMessage = "상품정보 읽기 실패했습니다"
        }
    }
    
    
}
