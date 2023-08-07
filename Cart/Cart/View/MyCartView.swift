//
//  MyCartView.swift
//  Cart
//
//  Created by 주진형 on 2023/08/07.
//

import SwiftUI

struct MyCartView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "questionmark.square.dashed")
                .font(.largeTitle)
            Text("Cart is empty.")
            Text("Please add your products!")
        }
    }
}

struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}
