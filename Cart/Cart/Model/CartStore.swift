//
//  CartStore.swift
//  Cart
//
//  Created by 주진형 on 2023/08/07.
//

import Foundation

class CartStore: ObservableObject {
    @Published var products: [Product] = []
    
    func addProduct(_ product: Product) {
        products.append(product)
    }
    
    func removeProducts(at offsets: IndexSet) {
        products.remove(atOffsets: offsets)
    }
}
