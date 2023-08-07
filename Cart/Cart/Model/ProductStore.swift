//
//  ProductStore.swift
//  Cart
//
//  Created by 주진형 on 2023/08/07.
//

import Foundation

class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        
    }
    
    func fetchProducts() {
        products = loadJson("products.json")
    }
    
    func loadJson(_ filename: String) -> [Product] {
        let data: Data
        
        // 프로젝트의 번들 파일들 중에서
        // 해당 이름의 파일이 존재하는지 확인해서
        // 그 파일이 있다면 file이라는 주소 값에 담고
        // 없다면 에러를 발생시키고 중지한다
        guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("\(filename) not found.")
        }
        
        // 존재하는 file 주소에 접근해 그 내용을 읽어서 Data 값으로 만든다
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Could not load \(filename): \(error)")
        }
        
        // 이제 Data 타입의 내용을 JSON이라고 생각해서
        // 원래 우리가 목표로 한 [Product] 타입으로 변환시켜 담아보도록 한다
        do {
            return try JSONDecoder().decode([Product].self, from: data)
        } catch {
            fatalError("Unable to parse \(filename): \(error)")
        }
    }
}
