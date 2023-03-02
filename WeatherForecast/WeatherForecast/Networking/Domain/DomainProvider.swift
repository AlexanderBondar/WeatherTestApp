//
//  DomainProvider.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - DomainProvider

public enum DomainProvider {
    
    public enum UseCases {
        public static let weatherList: WeatherForecastUseCase = WeatherForecastUseCaseImpl(
            storage: DataProvider.Storage.storageRepository,
            network: DataProvider.Network.networkRepository)
    }
}
