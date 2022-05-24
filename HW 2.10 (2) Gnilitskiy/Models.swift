//
//  Models.swift
//  HW 2.10 (2) Gnilitskiy
//
//  Created by Александр on 22.05.2022.
//

import Foundation

//struct Person: Decodable {
//    let books: String?
//    let characters: String?
//    let houses: String?
//}

struct Book: Decodable {
    let name: String?
    let numberOfPages: Int?
    let publisher: String?
}
