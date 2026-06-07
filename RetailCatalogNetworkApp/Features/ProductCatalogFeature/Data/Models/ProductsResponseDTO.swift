//
//  ProductsResponseDTO.swift
//  RetailCatalog
//
//  Created by Julian Urrutia on 29/05/26.
//

import Foundation

struct ProductsResponseDTO: Decodable {
    let products: [ProductDTO]
}
