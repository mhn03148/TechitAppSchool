//
//  Sticker.swift
//  Stickers
//
//  Created by 주진형 on 2023/07/07.
//

import Foundation
import SwiftUI

struct Sticker: Identifiable {
    var id: UUID = UUID()
    var memo: String
    var color: Color
    var date: Date
    
    var dateString: String {
        // 날짜 말고
        // 방금, 오늘 , 어제, 이번주, 이번달, ....도 가능
        let dateFormattter: DateFormatter = DateFormatter()
        dateFormattter.dateFormat = "yyyy-MM-dd EEEE HH:mm:ss"
        
        return dateFormattter.string(from: date)
    }
}
