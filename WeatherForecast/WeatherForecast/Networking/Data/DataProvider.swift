//
//  DataProvider.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - DataProvider

// NOTE: Instead of creating this instance should be DI container.
public enum DataProvider {
    
    public enum Network {
        public static let networkRepository: NetworkRepository = NetworkRepositoryImpl()
    }
}
