//
//  LocationDTO.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

struct LocationDTO: Codable {
    let name: String
    let country: String
    let localtime: String
}

// MARK: - DTO mappers

extension LocationDTO {
    
    func asDomain() -> LocationModel {
        
        return LocationModel(
            cityName: name,
            countryName: country,
            localtime: localtime
        )
    }
}
