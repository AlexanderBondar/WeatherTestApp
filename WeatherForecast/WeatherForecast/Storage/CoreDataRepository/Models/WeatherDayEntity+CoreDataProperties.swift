//
//  WeatherDayEntity+CoreDataProperties.swift
//  WeatherForecast
//
//  Created by dev on 24.03.2023.
//
//

import Foundation
import CoreData


extension WeatherDayEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherDayEntity> {
        return NSFetchRequest<WeatherDayEntity>(entityName: "WeatherDayEntity")
    }

    @NSManaged public var mintemp_c: Float
    @NSManaged public var maxtemp_c: Float
    @NSManaged public var condition: ConditionEntity
    @NSManaged public var forecastDay: ForecastDayEntity?

}

extension WeatherDayEntity : Identifiable {

}
