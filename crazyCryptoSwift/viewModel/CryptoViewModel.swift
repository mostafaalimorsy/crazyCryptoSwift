//
//  CryptoViewModel.swift
//  crazyCryptoSwift
//
//  Created by mostafa Morsy on 10/02/2025.
//

import Foundation


import Combine // Import Combine for ObservableObject

@MainActor
class CryptoListViewModel: ObservableObject {
    let webService = WebService()
    @Published var cryptoList = [CryptoViewModel]() // Corrected type here

    func fetchData() async  {
        guard let url = URL(string: ConstValues.baseUrl) else {
            print("Invalid URL") // Handle the case where the URL is invalid
            return
        }
        do{
            let crypto = try await webService.getDataa(url: url)
//            DispatchQueue.main.async { // Update UI on the main thread
                self.cryptoList = crypto.map(CryptoViewModel.init)
//            }
        } catch {
            print(error)
        }
//         webService.getData(url: url) { result in
//            DispatchQueue.main.async { // Update UI on the main thread
//                switch result {
//                case .success(let cryptos):
//                    self.cryptoList = cryptos.map(CryptoViewModel.init)
//                case .failure(let error):
//                    print("Error fetching data: \(error)")
//                    // Consider showing an error message to the user
//                }
//            }
//        }
    }
}


struct CryptoViewModel : Identifiable {
    let crypto : CryptoModel
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.name
    }
    
    var price : String {
        crypto.price
    }
}

