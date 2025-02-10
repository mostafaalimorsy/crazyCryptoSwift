//
//  CryptoModel.swift
//  crazyCryptoSwift
//
//  Created by mostafa Morsy on 10/02/2025.
//
import Foundation

struct CryptoModel : Hashable, Decodable, Identifiable {
    let id = UUID()
    let name: String
    let price: String
    
    private enum CodingKeys : String, CodingKey {
        case name = "currency"
        case price = "price"
    }
    
}
