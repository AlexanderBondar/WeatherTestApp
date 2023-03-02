//
//  WeatherDTO.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

public struct WeatherDTO: Codable {
    let location: LocationDTO
    let forecast: ForecastDTO
}

// MARK: - DTO mappers

extension WeatherDTO {
    
    func asDomain() -> WeatherModel {
        
        return WeatherModel(
            location: location.asDomain(),
            forecast: forecast.asDomain()
        )
    }
}
