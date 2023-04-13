//
//  WeatherEntity+CoreDataProperties.swift
//  WeatherForecast
//
//  Created by dev on 24.03.2023.
//
//

import Foundation
import CoreData


extension WeatherEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherEntity> {
        return NSFetchRequest<WeatherEntity>(entityName: "WeatherEntity")
    }
    
    @NSManaged public var updateDate: Date
    @NSManaged public var location: LocationEntity
    @NSManaged public var forecast: ForecastEntity

}

extension WeatherEntity : Identifiable {

}
