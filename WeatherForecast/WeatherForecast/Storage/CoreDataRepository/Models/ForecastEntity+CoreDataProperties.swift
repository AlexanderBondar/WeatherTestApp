//
//  ForecastEntity+CoreDataProperties.swift
//  WeatherForecast
//
//  Created by dev on 24.03.2023.
//
//

import Foundation
import CoreData


extension ForecastEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ForecastEntity> {
        return NSFetchRequest<ForecastEntity>(entityName: "ForecastEntity")
    }

    @NSManaged public var forecastDay: NSSet
    @NSManaged public var weather: WeatherEntity?

}

// MARK: Generated accessors for forecastDay
extension ForecastEntity {

    @objc(addForecastDayObject:)
    @NSManaged public func addToForecastDay(_ value: ForecastDayEntity)

    @objc(removeForecastDayObject:)
    @NSManaged public func removeFromForecastDay(_ value: ForecastDayEntity)

    @objc(addForecastDay:)
    @NSManaged public func addToForecastDay(_ values: NSSet)

    @objc(removeForecastDay:)
    @NSManaged public func removeFromForecastDay(_ values: NSSet)

}

extension ForecastEntity : Identifiable {

}
