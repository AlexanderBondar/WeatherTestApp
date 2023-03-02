//
//  HomeScreenViewModel.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

final class HomeScreenViewModel {
    
    // MARK: - Nested Types
    
    private enum Consts {
        static let city = "Sofia"
    }

    // MARK: - Public properties

    let dataSource = WeatherDataSource()
    var onUpdateDataSource: (() -> Void)?

    // MARK: - Private properties
    
    private let useCase: WeatherForecastUseCase
    
    // MARK: - Init
    
    init(useCase: WeatherForecastUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Public methods
    
    func fetchData() {
        loadByCity(Consts.city)
    }
    
    // MARK: - Private methods

    private func loadByCity(_ city: String) {
        
        useCase.getList(city: city) { [weak self] model in
            self?.dataSource.update(model)
            self?.onUpdateDataSource?()
        }
    }
}
