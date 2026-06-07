//
//  ProductMapper.swift
//  RetailCatalog
//
//  Created by Julian Urrutia on 28/05/26.
//

final class ProductMapper {
    static func toDomain(dto: ProductDTO) -> Product {
        return Product(
            id: String(dto.id),
            name: dto.title,
            price: dto.price,
            imageUrl: dto.thumbnail
        )
    }
}
