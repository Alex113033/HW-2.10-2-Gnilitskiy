//
//  NetworkManager.swift
//  HW 2.10 (2) Gnilitskiy
//
//  Created by Александр on 19.05.2022.
//

import Foundation

struct NetworkManager {
    
    static let networkManager = NetworkManager()
    
    private let stringUrl = "https://anapioficeandfire.com/api/books"
    
    func fetchBooks(_ completion: @escaping ([Book]) -> Void) {
        guard let url = URL(string: stringUrl) else { return }
        
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
