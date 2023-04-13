//
//  LocationEntity+CoreDataProperties.swift
//  WeatherForecast
//
//  Created by dev on 24.03.2023.
//
//

import Foundation
import CoreData


extension LocationEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationEntity> {
        return NSFetchRequest<LocationEntity>(entityName: "LocationEntity")
    }

    @NSManaged public var localtime: String
    @NSManaged public var country: String
    @NSManaged public var name: String
    @NSManaged public var weather: WeatherEntity?

}

extension LocationEntity : Identifiable {

}
