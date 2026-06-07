//
//  AppContainer.swift
//  RetailCatalog
//
//  Created by Julian Urrutia on 28/05/26.
//

import FactoryKit

extension Container {
        
    // MARK: - Infraestructure
    public var httpClient: Factory<HTTPClient> {
            self { URLSessionNetworkClient() }.singleton
    }
    
    var coreDataStorage: Factory<CoreDataStorageProtocol> {
        self { CoreDataStorage.shared }.singleton
    }
    
    var keychainStorage: Factory<KeychainStorageProtocol> {
        self { KeychainStorage() }.singleton
    }
}
