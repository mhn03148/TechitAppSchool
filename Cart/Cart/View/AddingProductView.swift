//
//  AddingProductView.swift
//  Cart
//
//  Created by 주진형 on 2023/08/07.
//

import SwiftUI

struct AddingProductView: View {
    var cartStore: CartStore
    @Binding var isShowingAdding: Bool
    
    @ObservedObject private var productStore: ProductStore = ProductStore()
    
    var body: some View {
        NavigationStack {
            List(productStore.products) { product in
                VStack(alignment: .leading) {
                    AsyncImage(url: product.imageURL) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(product.title)")
                                .font(.headline)
                            Text("\(product.author)")
                            Text("\(product.publisher)")
                            Text("\(product.priceString)")
                        }
                        Spacer()
                        Button("Add") {
                            cartStore.addProduct(product)
                            isShowingAdding.toggle()
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Add your product")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isShowingAdding.toggle()
                    }
                }
            }
            .refreshable {
                productStore.fetchProducts()
            }
            .onAppear {
                productStore.fetchProducts()
            }
        }
    }
}

struct AddingProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddingProductView(cartStore: CartStore(), isShowingAdding: .constant(true))
    }
}
