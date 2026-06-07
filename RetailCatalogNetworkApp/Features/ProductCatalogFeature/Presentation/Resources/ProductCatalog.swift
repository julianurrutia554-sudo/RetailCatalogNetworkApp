//
//  ProductCatalog.swift
//  RetailCatalog
//
//  Created by Julian Urrutia on 07/06/26.
//

import Foundation

public enum Strings {
    private final class BundleToken {}
    public static func localized(keyString: String, usingFile fileName: String, bundle: Bundle? = nil) -> String {
        let targetBundle = bundle ?? Bundle(for: BundleToken.self)
        return NSLocalizedString(keyString, tableName: fileName, bundle: targetBundle, value: "", comment: "")
    }
}

public extension Strings {
    enum ProductCatalog: String {
        case free = "Free"
        case trending = "Trending"
        case catalog = "Catalog"

        private var fileName: String { "ProductCatalog" }

        public var localized: String {
            return Strings.localized(keyString: self.rawValue, usingFile: fileName)
        }
    }
}
