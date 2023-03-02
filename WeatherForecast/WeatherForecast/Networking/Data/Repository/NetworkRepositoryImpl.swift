//
//  NetworkRepositoryImpl.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - NetworkRepositoryImpl

final class NetworkRepositoryImpl: NetworkRepository {
    
    // MARK: - Public methods
    
    func perform<Response: Decodable>(_ endpoint: Endpoint) async -> NetworkResult<Response> {
        
        guard var components = URLComponents(string: endpoint.basePath + endpoint.path) else {
            return .failure(.invalidURL)
        }
        
        endpoint.urlParams?.forEach {
            let queryItem = URLQueryItem(name: $0.key, value: $0.value)
            
            if components.queryItems == nil {
                components.queryItems = [queryItem]
            } else {
                components.queryItems?.append(queryItem)
            }
        }
        
        guard let url = components.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        
        if let body = endpoint.body {
            let data = try? JSONSerialization.data(
                withJSONObject: body,
                options: []
            )
            
            request.httpBody = data
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.failure)
            }
            switch response.statusCode {
                case 200...299:
                    do {
                        let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                        return .success(decodedResponse)
                    } catch {
                        debugPrint("error: \(error)")
                        return .failure(.decodingError)
                    }
                    
                case 401:
                    return .failure(.unauthorized)
                default:
                    return .failure(.failure)
            }
        } catch {
            return .failure(.failure)
        }
    }
}
