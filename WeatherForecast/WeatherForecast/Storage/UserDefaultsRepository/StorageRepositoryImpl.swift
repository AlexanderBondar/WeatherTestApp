//
//  UserDefaultsRepository.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - StorageRepositoryImpl

final class UserDefaultsRepository {
    
    // MARK: - Private properties
    
    private let userDefaults = UserDefaults.standard

}

// MARK: - StorageRepository 

extension UserDefaultsRepository: StorageRepository {
    
    func getWeather() -> WeatherDTO? {
        do {
            return try userDefaults.getObject(castTo: WeatherDTO.self)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func saveWeather(_ weather: WeatherDTO) {
        do {
            try userDefaults.setObject(weather)
        } catch {
            print(error.localizedDescription)
        }
    }
}
