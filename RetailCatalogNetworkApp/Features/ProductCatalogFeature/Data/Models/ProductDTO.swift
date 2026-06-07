//
//  ProductDTO.swift
//  RetailCatalog
//
//  Created by Julian Urrutia on 28/05/26.
//

struct ProductDTO: Decodable {
    let id: Int
    let title: String
    let price: Double
    let thumbnail: String
}
