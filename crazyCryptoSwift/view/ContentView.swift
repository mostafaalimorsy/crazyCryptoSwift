//
//  ContentView.swift
//  crazyCryptoSwift
//
//  Created by mostafa Morsy on 10/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : CryptoListViewModel
    
    init() {
        self.viewModel = CryptoListViewModel()
    }

    var body: some View {
        NavigationView{
            List(viewModel.cryptoList , id: \.id){ data in
                VStack{
                    Text(data.currency).font(.title3).foregroundStyle(.blue).frame(maxWidth: .infinity, alignment: .leading)
                    Text(data.price).foregroundStyle(.yellow)
                }
            }.toolbar(content: {
                Button{
                    Task.init {
                        await viewModel.fetchData()
                    }
                } label: {
                    Text("Refresh")
                }
            }).navigationTitle("Crypto List")
        }.task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
