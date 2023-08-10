//
//  ProductStore.swift
//  Cart
//
//  Created by 주진형 on 2023/08/07.
//

import Foundation
//https://mocki.io/v1/2883925e-6a16-483c-8f32-eb7200b5e98f
class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    @Published var fetchMessage: String = ""
    
    init() {
        
    }
    
    func fetchProducts() async{
        
//        products = loadJson("products.json")
//    }
//
//    func loadJson(_ filename: String) -> [Product] {
//        let data: Data
//
//        // 프로젝트의 번들 파일들 중에서
//        // 해당 이름의 파일이 존재하는지 확인해서
//        // 그 파일이 있다면 file이라는 주소 값에 담고
//        // 없다면 에러를 발생시키고 중지한다
//        guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
//            fatalError("\(filename) not found.")
//        }
//
//        // 존재하는 file 주소에 접근해 그 내용을 읽어서 Data 값으로 만든다
//        do {
//            data = try Data(contentsOf: file)
//        } catch {
//            fatalError("Could not load \(filename): \(error)")
//        }
//
//        // 이제 Data 타입의 내용을 JSON이라고 생각해서
//        // 원래 우리가 목표로 한 [Product] 타입으로 변환시켜 담아보도록 한다
//        do {
//            return try JSONDecoder().decode([Product].self, from: data)
//        } catch {
//            fatalError("Unable to parse \(filename): \(error)")
//        }
        let urlString: String = "https://mocki.io/v1/2883925e-6a16-483c-8f32-eb7200b5e98f"
        
        guard let url = URL(string: urlString) else {
            print("Wrong URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("\(response)")
            
            let jsonString = String(data: data, encoding: .utf8)
            print("\(jsonString ?? "")")
            
            products = try JSONDecoder().decode([Product].self, from: data)
            
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
