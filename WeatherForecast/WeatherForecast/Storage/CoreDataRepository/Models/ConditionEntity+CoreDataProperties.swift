//
//  ConditionEntity+CoreDataProperties.swift
//  WeatherForecast
//
//  Created by dev on 24.03.2023.
//
//

import Foundation
import CoreData


extension ConditionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ConditionEntity> {
        return NSFetchRequest<ConditionEntity>(entityName: "ConditionEntity")
    }

    @NSManaged public var text: String
    @NSManaged public var icon: String
    @NSManaged public var code: Int32
    @NSManaged public var weatherDay: WeatherDayEntity?

}

extension ConditionEntity : Identifiable {

}
