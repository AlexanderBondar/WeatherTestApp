//
//  WeatherAPI.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - WeatherAPI

public enum WeatherAPI {
    
    case getForecastList(String)
}

extension WeatherAPI: Endpoint {
    
    public var basePath: String { "https://api.weatherapi.com/" }
    
    public var httpMethod: HTTPMethod { .get }
    
    public var body: Encodable? { nil }
    
    public var headers: HTTPHeaders { [:] }
    
    public var path: String {
        "v1/forecast.json"
    }
    
    public var urlParams: Parameters? {
        switch self {
            case .getForecastList(let city):
                return [
                    "key": "522db6a157a748e2996212343221502",
                    "q": city,
                    "days": "7",
                    "aqi": "no",
                    "alerts": "no"
                ]
        }
    }
}
