//
//  NetworkError.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - NetworkError

public enum NetworkError: Error {
    case failure
    case invalidURL
    case unauthorized
    case decodingError
}
