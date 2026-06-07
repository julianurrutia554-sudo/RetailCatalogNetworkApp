//
//  RetailAPI.swift
//  RetailCatalogNetworkApp
//
//  Created by Julian Urrutia on 29/05/26.
//

import Foundation

enum RetailAPI: TargetType {
    case getProducts
    case getProductDetail(id: String)
    
    var baseURL: URL {
        return URL(string: "https://api.tu-retail.com/v1")!
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return "products"
        case .getProductDetail(let id):
            return "products/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getProducts, .getProductDetail:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var queryParameters: [String : Any]? {
        return nil
    }
}
