//
//  ErrorHandelr.swift
//  crazyCryptoSwift
//
//  Created by mostafa Morsy on 10/02/2025.
//

enum HandelerError: Error {
    case invalidInput
    case invalidUrl
    case noData
    case cantDecode
    case invalidResponse // New case for bad HTTP status codes
    case unknown // A general error
}
