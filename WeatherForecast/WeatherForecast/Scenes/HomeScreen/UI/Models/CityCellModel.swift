//
//  CityCellModel.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

final class CityCellModel: CellModelProtocol {
    
    // MARK: - Private properties

    private let locationModel: LocationModel
    
    // MARK: - Public properties

    var date: String {
        locationModel.localtime
    }
    
    var cityName: String {
        locationModel.cityName + ", " + locationModel.countryName
    }
    
    // MARK: - Init

    init(model: LocationModel) {
        self.locationModel = model
    }
}
