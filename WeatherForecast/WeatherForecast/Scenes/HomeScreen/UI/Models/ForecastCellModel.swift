//
//  ForecastCellModel.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation
import UIKit

final class ForecastCellModel: CellModelProtocol {
    
    // MARK: - Private properties

    private let forecastDayModel: ForecastDayModel    
    
    // MARK: - Public properties
    
    var image: UIImage? {
        UIImage(named: "\(forecastDayModel.currentDay.condition.code)")
    }

    var temperature: String {
        "Min:" + "\(forecastDayModel.currentDay.minTempInC)" + " C" + "    Max:" + "\(forecastDayModel.currentDay.maxTempInC)" + " C"
    }
    
    var date: String {
        forecastDayModel.currentDate
    }
    
    // MARK: - Init

    init(model: ForecastDayModel) {
        self.forecastDayModel = model
    }
}
