//
//  StickerColorSelectView.swift
//  Stickers
//
//  Created by 주진형 on 2023/07/07.
//

import SwiftUI

struct StickerColorSelectView: View {
    @Binding var selectedColor: Color
    let color: Color
    var body: some View {
        Button {
            selectedColor = color
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(color)
                    .shadow(radius: 6)
                    .frame(height: 60)
                
                if selectedColor == color {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct StickerColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
        StickerColorSelectView(selectedColor: .constant(.blue), color: .cyan)
    }
}
