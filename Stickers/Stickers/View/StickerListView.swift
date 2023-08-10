//
//  StickerListView.swift
//  Stickers
//
//  Created by 주진형 on 2023/07/07.
//

import SwiftUI

struct StickerListView: View {
    
    @StateObject var stickerStore: StickerStore = StickerStore()
    // 바인딩으로 넘기는 bool, Int 같은 기본값에는
    // State 프로퍼티 래퍼를 꼭 달아줘야 한다
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        VStack{
            List (stickerStore.stickers) { sticker in
                StickerView(stickerStore: stickerStore, sticker: sticker)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Stickers")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowingSheet = true
                } label: {
                    Label("Add", systemImage: "pencil.tip.crop.circle.badge.plus")
                }
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            // sheet에 ispresented 매개변수로 보내주는
            // 바인딩된 isShowingSheet은
            // (손으로 끌어내려서) sheet가 내려가면
            // 내부에서 알아서 그 값을 알아서 false로 바꾼다.
            StickerAddView(stickerStore: stickerStore, isShowingSheet: $isShowingSheet)
        }
    }
}

struct StickerListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            StickerListView()
        }
    }
}
