//
//  WeatherDayDTO.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

struct WeatherDayDTO: Codable {
    let mintemp_c: Float
    let maxtemp_c: Float
    let condition: ConditionDTO
}

// MARK: - DTO mappers

extension WeatherDayDTO {
    
    func asDomain() -> WeatherDayModel {
        
        return WeatherDayModel(
            minTempInC: mintemp_c,
            maxTempInC: maxtemp_c,
            condition: condition.asDomain()
        )
    }
}
