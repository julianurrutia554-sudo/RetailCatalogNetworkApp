//
//  ProductDetailViewModel.swift
//  RetailCatalog
//
//  Created by Julian Urrutia on 29/05/26.
//

@MainActor
final class ProductDetailViewModel {
    let product: ProductUIModel

    init(product: ProductUIModel) {
        self.product = product
    }
}
