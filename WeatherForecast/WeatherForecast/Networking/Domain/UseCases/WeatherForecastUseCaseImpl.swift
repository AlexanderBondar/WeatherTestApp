//
//  WeatherForecastUseCaseImpl.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - WeatherForecastUseCaseImpl

struct WeatherForecastUseCaseImpl: WeatherForecastUseCase {
    
    // MARK: - Private properteis
    
    private let storage: StorageRepository
    private let network: NetworkRepository
    private let taskPriority = TaskPriority.medium
    
    // MARK: - Init
    
    init(
        storage: StorageRepository,
        network: NetworkRepository
    ) {
        self.storage = storage
        self.network = network
    }
    
    // MARK: - Public methods
    
    func getList(
        city: String,
        completion: @escaping (WeatherModel?) -> ()
    ) {
        
        if let weather = getActualWeatherFromStorage() {
            completion(weather.asDomain())
            return
        }
        
        Task(priority: taskPriority) {
            var result: WeatherModel
            let response: NetworkResult<WeatherDTO>
            
            response = await network.perform(WeatherAPI.getForecastList(city))
            
            switch response {
                    
                case .success(var response):
                    response.updateDate = Date()
                    storage.saveWeather(response)

                    result = response.asDomain()
                    DispatchQueue.main.async { [result] in
                        completion(result)
                    }
                case .failure:
                    completion(nil)
            }
        }
    }
    
    // MARK: - Private methods

    private func getActualWeatherFromStorage() -> WeatherDTO? {
        
        //check if its first fetching
        guard
            let weather = storage.getWeather(),
            let lastUpdate = weather.updateDate
        else {
            return nil
        }

        //check if more than one day has passed after last update from network
        if Date.now.distance(from: lastUpdate, only: .day) > 0 {
            return nil
        }
        
        return weather
    }
}
