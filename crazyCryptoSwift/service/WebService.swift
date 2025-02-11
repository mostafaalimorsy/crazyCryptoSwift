//
//  WebService.swift
//  crazyCryptoSwift
//
//  Created by mostafa Morsy on 10/02/2025.
//

import Foundation



    

    class WebService {
        
        func getDataa(url: URL) async throws -> [CryptoModel] {
           let (data , _ ) = try! await URLSession.shared.data(from: url)
            
            let curencies = try JSONDecoder().decode([CryptoModel].self, from: data)
            
            return curencies
        }
        

        func getData(url: URL, completion: @escaping (Result<[CryptoModel], HandelerError>) -> Void) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(.invalidUrl)) // Or a more specific error
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.invalidResponse))
                    return
                }

                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }

                do {
                    let cryptoModel = try JSONDecoder().decode([CryptoModel].self, from: data)
                    completion(.success(cryptoModel))
                } catch let decodingError as DecodingError {
                    print("Decoding Error: \(decodingError)") // Print for debugging
                    completion(.failure(.cantDecode))
                } catch {
                    completion(.failure(.unknown))
                }
            }.resume() // Don't forget to resume the task!
        }
    }
    
    


