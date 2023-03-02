//
//  WeatherForecastUseCase.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - WeatherForecastUseCase

public protocol WeatherForecastUseCase {
    
    func getList(
        city: String,
        completion: @escaping (WeatherModel?) -> ()
    )
}
