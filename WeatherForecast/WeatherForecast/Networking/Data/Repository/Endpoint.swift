//
//  Endpoint.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: String]

// MARK: - Endpoint

public protocol Endpoint {
    
    var basePath: String { get }
    var path: String { get }
    
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    
    var body: Encodable? { get }
    var urlParams: Parameters? { get }    
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
