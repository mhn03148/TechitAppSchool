//
//  ContentView.swift
//  Cart
//
//  Created by Jongwook Park on 2023/08/07.
//

import SwiftUI
import SafariServices

extension Double {
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "KRW"
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

struct SafariView: UIViewControllerRepresentable {
    @Binding var url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // ...
    }
}

struct ContentView: View {
    @ObservedObject var cartStore: CartStore = CartStore()
    
    @State private var isShowingAdding: Bool = false
    @State private var isShowingShop: Bool = false
    @State private var shopURL: URL = URL(string: "https://apple.com")!
    
    private var isCartEmpty: Bool {
        return cartStore.products.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if isCartEmpty {
                    MyCartView()
                }
                List {
                    ForEach(cartStore.products) { product in
                        HStack {
                            AsyncImage(url: product.imageURL) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            VStack(alignment: .leading) {
                                Text("\(product.title)")
                                    .font(.headline)
                                Text("\(product.priceString)")
                            }
                            
                            Spacer()
                            
                            Button("Buy") {
                                shopURL = product.shopURL
                                isShowingShop.toggle()
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .onDelete { offsets in
                        cartStore.removeProducts(at: offsets)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Cart")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        isShowingAdding.toggle()
                    }
                }
            }
            .sheet(isPresented: $isShowingAdding) {
                AddingProductView(cartStore: cartStore, isShowingAdding: $isShowingAdding)
            }
            .sheet(isPresented: $isShowingShop) {
                SafariView(url: $shopURL)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

