//
//  Product.swift
//  Cart
//
//  Created by 주진형 on 2023/08/07.
//

import Foundation

struct Product: Identifiable, Codable {
    var id: String
    var title: String
    var publisher: String
    var author: String
    var price: Double
    var imageURLString: String
    var shopURLString: String
    
    var priceString: String {
        price.currencyString
    }
    
    var imageURL: URL {
        URL(string: imageURLString) ?? URL(string: "https://apple.com")!
    }
    
    var shopURL: URL {
        URL(string: shopURLString) ?? URL(string: "https://apple.com")!
    }
}
