//
//  NetworkRepository.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

public typealias NetworkResult<T: Decodable> = Result<T, NetworkError>

// MARK: - NetworkRepository

public protocol NetworkRepository {
    
    func perform<Response: Decodable>(_ endpoint: Endpoint) async -> NetworkResult<Response>
}
