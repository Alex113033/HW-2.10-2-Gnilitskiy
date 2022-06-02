//
//  Models.swift
//  HW 2.10 (2) Gnilitskiy
//
//  Created by Александр on 22.05.2022.
//

import Foundation

enum Link: String {
    case houses = "https://anapioficeandfire.com/api/houses"
    case books = "https://anapioficeandfire.com/api/books"
}

// MARK: - House
struct House: Decodable {
    let name: String?
    let region: String?
    let coatOfArms: String?
    let words: String?

    init(name: String, region: String, coatOfArms: String, words: String) {
        self.name = name
        self.region = region
        self.coatOfArms = coatOfArms
        self.words = words
    }
    
    init(houseData: [String: Any]) {
        name = houseData["name"] as? String
        region = houseData["region"] as? String
        coatOfArms = houseData["coatOfArms"] as? String
        words = houseData["words"] as? String
    }
    
    static func getHouses(from value: Any) -> [House] {
        guard let housesData = value as? [[String: Any]] else { return [] }
        return housesData.compactMap { House(houseData: $0) }
    }
}

struct Book: Decodable {
    let name: String?
    let numberOfPages: Int?
    let publisher: String?
}

