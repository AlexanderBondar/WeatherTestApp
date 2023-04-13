//
//  StorageRepository.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - StorageRepository

public protocol StorageRepository {
    func getWeather() -> WeatherDTO?
    func saveWeather(_ weather: WeatherDTO)
}
