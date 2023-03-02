//
//  ForecastDTO.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

struct ForecastDTO: Codable {
    let forecastday: [ForecastDayDTO]
}

struct ForecastDayDTO: Codable {
    let date: String
    let day: WeatherDayDTO
}

// MARK: - DTO mappers

extension ForecastDTO {
    
    func asDomain() -> ForecastModel {
        
        return ForecastModel(forecastDays: forecastday.map { $0.asDomain() })
    }
}

extension ForecastDayDTO {
    
    func asDomain() -> ForecastDayModel {
        
        return ForecastDayModel(
            currentDate: date,
            currentDay: day.asDomain()
        )
    }
}
