//
//  ForecastDayEntity+CoreDataProperties.swift
//  WeatherForecast
//
//  Created by dev on 24.03.2023.
//
//

import Foundation
import CoreData


extension ForecastDayEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ForecastDayEntity> {
        return NSFetchRequest<ForecastDayEntity>(entityName: "ForecastDayEntity")
    }

    @NSManaged public var date: String
    @NSManaged public var day: WeatherDayEntity
    @NSManaged public var forecast: ForecastEntity?

}

extension ForecastDayEntity : Identifiable {

}
