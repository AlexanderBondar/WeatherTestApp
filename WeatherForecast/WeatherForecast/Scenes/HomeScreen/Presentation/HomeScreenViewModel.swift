//
//  HomeScreenViewModel.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

final class HomeScreenViewModel {
    
    private let city = "Praha"

    // MARK: - Private properties
    
    private let useCase: WeatherForecastUseCase
    
    // MARK: - Init
    
    init(useCase: WeatherForecastUseCase) {
        self.useCase = useCase
        
        loadByCity(city)
    }
    
    
    private func loadByCity(_ city: String) {
        
        useCase.getList(city: city) { [weak self] model in
            print()
        }
    }
}
