//
//  NetworkManager.swift
//  HW 2.10 (2) Gnilitskiy
//
//  Created by Александр on 19.05.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct NetworkManager {
    
    static let networkManager = NetworkManager()
    
    // MARK: - function network for house button
    
    func fetchHouses(_ url: String, completion: @escaping (Result<[House], NetworkError>)  -> Void) {
        AF.request(Link.houses.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let houses = House.getHouses(from: value)
                    DispatchQueue.main.async {
                        completion(.success(houses))
                    }
                case .failure:
                    print("Error")
                }
            }
    }
    
    // MARK: - function network for books button
    
    func fetchBooks(_ completion: @escaping ([Book]) -> Void) {
        guard let url = URL(string: Link.books.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let books = try JSONDecoder().decode([Book].self, from: data)
                completion(books)
                print(books)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

