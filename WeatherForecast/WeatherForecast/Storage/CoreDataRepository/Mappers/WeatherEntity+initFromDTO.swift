//
//  WeatherEntity+initFromDTO.swift
//  WeatherForecast
//
//  Created by dev on 24.03.2023.
//

import CoreData
import Foundation

extension ConditionEntity {
    
    convenience init(
        _ conditionDTO: ConditionDTO,
        context: NSManagedObjectContext
    ) {
        self.init(context: context)
        
        text = conditionDTO.text
        icon = conditionDTO.icon
        code = Int32(conditionDTO.code)
    }
}

extension LocationEntity {
    
    convenience init(
        _ locationDTO: LocationDTO,
        context: NSManagedObjectContext
    ) {
        self.init(context: context)
        
        name = locationDTO.name
        country = locationDTO.country
        localtime = locationDTO.localtime
    }
}

extension WeatherDayEntity {

    convenience init(
        _ weatherDayDTO: WeatherDayDTO,
        context: NSManagedObjectContext
    ) {
        self.init(context: context)
        
        let cond = ConditionEntity(
            weatherDayDTO.condition,
            context: context
        )
        
        mintemp_c = weatherDayDTO.mintemp_c
        maxtemp_c = weatherDayDTO.maxtemp_c
        condition = cond
    }
}

extension ForecastDayEntity {
    
    convenience init(
        _ forecastDayDTO: ForecastDayDTO,
        context: NSManagedObjectContext
    ) {
        self.init(context: context)
        
        let forecastDay = WeatherDayEntity(
            forecastDayDTO.day,
            context: context
        )
        
        date = forecastDayDTO.date
        day = forecastDay
    }
}

extension ForecastEntity {
    
    convenience init(
        _ forecastDaysDTO: ForecastDTO,
        context: NSManagedObjectContext
    ) {
        self.init(context: context)
        
        let forecastDays = forecastDaysDTO.forecastday.map {
            ForecastDayEntity($0, context: context)
        }
        
        forecastDay = NSSet(array: forecastDays)
    }
}

extension WeatherEntity {
    
    convenience init(
        _ weatherDTO: WeatherDTO,
        context: NSManagedObjectContext
    ) {
        self.init(context: context)
        
        location = LocationEntity(
            weatherDTO.location,
            context: context
        )
        forecast = ForecastEntity(
            weatherDTO.forecast,
            context: context
        )
        if let date = weatherDTO.updateDate { updateDate = date }
    }
}
