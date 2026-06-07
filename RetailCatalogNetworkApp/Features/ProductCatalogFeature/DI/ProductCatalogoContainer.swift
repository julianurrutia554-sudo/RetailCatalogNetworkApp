//
//  ProductCatalogoContainer.swift
//  RetailCatalogNetworkApp
//
//  Created by Julian Urrutia on 7/06/26.
//

import FactoryKit
import UIKit

public final class ProductCatalogContainer: SharedContainer {
    public static let shared = ProductCatalogContainer()
    public let manager = ContainerManager()
}

extension ProductCatalogContainer {
    
    // MARK: - Data
    var productsRepository: Factory<ProductsRepositoryProtocol> {
        self {
            DefaultProductsRepository(
                cacheStorage: Container.shared.coreDataStorage()
            )
        }
    }

    // MARK: - Domain
    var fetchProductsUseCase: Factory<FetchProductsUseCase> {
        self { FetchProductsUseCase(repository: self.productsRepository()) }
    }

    // MARK: - Presentation
    @MainActor
    var productListViewModel: Factory<ProductListViewModel> {
        self { ProductListViewModel(fetchProductsUseCase: self.fetchProductsUseCase()) }
    }
    
    @MainActor
    var productDetailViewController: ParameterFactory<ProductUIModel, ProductDetailViewController> {
        self { product in
            let viewModel = ProductDetailViewModel(product: product)
            return ProductDetailViewController(viewModel: viewModel)
        }
    }

}

