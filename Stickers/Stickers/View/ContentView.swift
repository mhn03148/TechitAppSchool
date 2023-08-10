//
//  ContentView.swift
//  Stickers
//
//  Created by 주진형 on 2023/07/07.
//

import SwiftUI

// ContentView에 다 담지 말고
// 최소의 기능만 담아보자
// 여기엔 NavigationStack만 생각해주는 걸로
struct ContentView: View {
    var body: some View {
        NavigationStack{
            StickerListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
