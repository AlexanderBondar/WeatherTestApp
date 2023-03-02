//
//  StorageRepository.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - StorageRepository

public protocol StorageRepository {
    
    func getObject<T: Codable>(by type: T.Type) -> T?
    func saveObject(_ object: Codable)
}
