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
        completion: @escaping (WeatherModel) -> ()
    ) {
        
        if let object = storage.getObject(by: WeatherDTO.self) {
            completion(object.asDomain())
            return
        }
        
        Task(priority: taskPriority) {
            var result: WeatherModel
            let response: NetworkResult<WeatherDTO>
            
            response = await network.perform(WeatherAPI.getForecastList(city))
            
            switch response {
                    
                case .success(let response):
                    result = response.asDomain()
                    storage.saveObject(response)

                    DispatchQueue.main.async { [result] in
                        completion(result)
                    }
                case .failure:
                    print()
            }
        }
    }
}
