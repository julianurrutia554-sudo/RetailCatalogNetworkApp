//
//  DefaultProductsRepository.swift
//  RetailCatalog
//
//  Created by Julian Urrutia on 28/05/26.
//

import Foundation
import FactoryKit

final class DefaultProductsRepository: ProductsRepositoryProtocol {
    
    @Injected(\.httpClient) private var networkService
    private let cacheStorage: CoreDataStorageProtocol
    
    init(cacheStorage: CoreDataStorageProtocol) {
        self.cacheStorage = cacheStorage
    }
    
    func getProducts() async throws -> [Product] {
        do {
            let dtos: [ProductDTO] = try await networkService.request(target: RetailAPI.getProducts)
            return dtos.map { ProductMapper.toDomain(dto: $0) }
        } catch {
            #if DEBUG
            print("⚠️ Caída de red. Usando contingencia local.")
            #endif            
            return [
                Product(id: "MOCK-01", name: "Chaqueta Denim Local", price: 49.99, imageUrl: "")
            ]
        }
    }
}
