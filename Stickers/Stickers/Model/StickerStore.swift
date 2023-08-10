//
//  StickerStore.swift
//  Stickers
//
//  Created by 주진형 on 2023/07/07.
//

import Foundation
import SwiftUI
class StickerStore: ObservableObject {
    @Published var stickers: [Sticker] = []
    
    //테스트를 위해 미리 자료를 심어봅시다.
    init() {
        stickers = [
            Sticker(memo: "Hello", color: .blue, date:Date()),
            Sticker(memo: "Hi", color: .brown, date:Date()),
            Sticker(memo: "Hello man", color: .yellow, date:Date()),
        ]
    }
    
    func addSticker(memo: String, color: Color) {
        let sticker = Sticker(memo: memo, color: color, date: Date())
        
        stickers.insert(sticker, at:0)
    }
    
    func removeSticker(_ sticker: Sticker) {
        var index: Int = 0
        for tempSticker in stickers {
            if tempSticker.id == sticker.id {
                stickers.remove(at: index)
                break
            }
            
            index += 1
        }
    }
}
