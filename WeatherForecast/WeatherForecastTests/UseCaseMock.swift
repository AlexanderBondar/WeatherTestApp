//
//  UseCaseMock.swift
//  WeatherForecastTests
//
//  Created by dev on 02.03.2023.
//

import Foundation

public struct WeatherForecastUseCaseStub: WeatherForecastUseCase {
    
    let responceMock: WeatherModel
    
    public func getList(
        city: String,
        completion: @escaping (WeatherModel) -> ()
    ) {
        completion(responceMock)
    }
}
