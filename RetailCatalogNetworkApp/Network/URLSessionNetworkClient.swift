//
//  URLSessionNetworkClient.swift
//  RetailCatalogNetworkApp
//
//  Created by Julian Urrutia on 29/05/26.
//

import Foundation

public class URLSessionNetworkClient: HTTPClient {
    private let interceptors: [RequestInterceptor]
    
    public init(interceptors: [RequestInterceptor] = []) {
        self.interceptors = interceptors
    }
    
    public func request<T: Decodable>(target: TargetType) async throws -> T {
        var url = target.baseURL.appendingPathComponent(target.path)
        if let queryParams = target.queryParameters,
           var components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            components.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            if let formattedURL = components.url { url = formattedURL }
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        
        target.headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        interceptors.forEach { $0.intercept(&request) }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknown(0)
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError(error)
            }
        case 401: throw NetworkError.unauthorized
        case 404: throw NetworkError.notFound
        case 500...599: throw NetworkError.serverError
        default: throw NetworkError.unknown(httpResponse.statusCode)
        }
    }
}
