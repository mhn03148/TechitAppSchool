//
//  StickersApp.swift
//  Stickers
//
//  Created by 주진형 on 2023/07/07.
//

import SwiftUI

// SwiftUI 에서 App은 Scene이라는 장면을 가지고 화면을 나타낸다
// Scene 에는 WindowGroup을 갖고 그 안에 여러 개의 View들을 담을 수 있다. (단, ios는 보통 하나의 View로 제약)
@main
struct StickersApp: App {
    var body: some Scene {
        
        // windowGroup은 여러개의 view들이
        WindowGroup {
            ContentView()
        }
    }
}
