//
//  ConditionDTO.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

struct ConditionDTO: Codable {
    let text: String
    let icon: String
    let code: Int
}

// MARK: - DTO mappers

extension ConditionDTO {
    
    func asDomain() -> ConditionModel {
        
        return ConditionModel(
            text: text,
            icon: icon,
            code: code
        )
    }
}
