//
//  ForecastModel.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

struct ForecastModel {
    let forecastDays: [ForecastDayModel]
}

struct ForecastDayModel {
    let currentDate: String
    let currentDay: WeatherDayModel
}
