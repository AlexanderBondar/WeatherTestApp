//
//  SectionModel.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

enum HeaderType {
    case city
    case forecast
}

struct SectionModel {
    let type: HeaderType
    let cells: [CellModelProtocol]
}
