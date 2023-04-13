//
//  WeatherEntity+asDTO.swift
//  WeatherForecast
//
//  Created by dev on 24.03.2023.
//

import Foundation

extension ConditionEntity {
    
    func asDTO() -> ConditionDTO {

        return ConditionDTO(
            text: text,
            icon: icon,
            code: Int(code)
        )
    }
}

extension LocationEntity {
    
    func asDTO() -> LocationDTO {
        
        return LocationDTO(
            name: name,
            country: country,
            localtime: localtime
        )
    }
}

extension WeatherDayEntity {
    
    func asDTO() -> WeatherDayDTO {
        
        return WeatherDayDTO(
            mintemp_c: mintemp_c,
            maxtemp_c: maxtemp_c,
            condition: condition.asDTO()
        )
    }
}

extension ForecastDayEntity {
    
    func asDTO() -> ForecastDayDTO {
        
        return ForecastDayDTO(
            date: date,
            day: day.asDTO()
        )
    }
}

extension ForecastEntity {
    
    func asDTO() -> ForecastDTO {
        
        return ForecastDTO(forecastday: forecastDay.compactMap { ($0 as? ForecastDayEntity)?.asDTO() })
    }
}

extension WeatherEntity {
    
    func asDTO() -> WeatherDTO {
        
        return WeatherDTO(
            location: location.asDTO(),
            forecast: forecast.asDTO(),
            updateDate: updateDate
        )
    }
}
