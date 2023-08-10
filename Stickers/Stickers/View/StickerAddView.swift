//
//  StickerAddView.swift
//  Stickers
//
//  Created by 주진형 on 2023/07/07.
//

import SwiftUI

struct StickerAddView: View {
    var stickerStore: StickerStore
    @Binding var isShowingSheet: Bool
    @State var memo: String = ""
    @State var selectedColor: Color = .cyan
    
    let colors: [Color] = [.cyan, .purple, .blue, .yellow, .brown]
    
    var body: some View {
        NavigationStack{
            // Form은 List와 다르게
            // 나타나는 항목들이 모두 제각각 다른 형태의 것일때 유용하다.
            VStack (alignment: .leading) {
                Text("Select a color")
                    .font(.title)
                HStack {
                    ForEach(colors, id: \.self) { color in
                        StickerColorSelectView(selectedColor: $selectedColor, color: color)
                    }
                }
                Divider()
                    .padding()
                Text("Write a memo")
                    .font(.title)
                TextField("Memo", text: $memo, axis: .vertical)
                    .font(.title)
                Spacer()
                
            }
            .padding()
            .listStyle(.plain)
            .navigationTitle("Add a sticker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading){
                    Button("Cancel") {
                        isShowingSheet = false
                    }
                }
                ToolbarItem (placement: .navigationBarTrailing){
                    Button("Submit") {
                        stickerStore.addSticker(memo: memo, color: selectedColor)
                        isShowingSheet = false
                    }
                }
            }
        }
    }
}


struct StickerAddView_Previews: PreviewProvider {
    static var previews: some View {
        StickerAddView(stickerStore: StickerStore() ,isShowingSheet: .constant(true))
    }
}
