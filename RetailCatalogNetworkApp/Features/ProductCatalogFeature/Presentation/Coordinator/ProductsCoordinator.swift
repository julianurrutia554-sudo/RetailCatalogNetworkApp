//
//  ProductsCoordinator.swift
//  RetailCatalog
//
//  Created by Julian Urrutia on 28/05/26.
//

import UIKit
import FactoryKit

@MainActor
final class ProductsCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ProductCatalogContainer.shared.productListViewModel()
        let viewController = ProductListViewController(viewModel: viewModel)
        viewController.onProductSelected = { [weak self] product in
            self?.showDetail(product: product)
        }
        navigationController.pushViewController(viewController, animated: true)
    }

    func showDetail(product: ProductUIModel) {
        let viewController = ProductCatalogContainer.shared.productDetailViewController(product)
        navigationController.pushViewController(viewController, animated: true)
    }
}
