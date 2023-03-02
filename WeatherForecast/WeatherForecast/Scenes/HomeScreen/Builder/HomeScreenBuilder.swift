//
//  HomeScreenBuilder.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation
import UIKit

enum HomeScreenBuilder {
    
    static func buildHomeScene() -> UIViewController {
        let viewModel = HomeScreenViewModel(useCase: DomainProvider.UseCases.weatherList)
        let homeVC = HomeViewController(viewModel: viewModel)
        
        return homeVC
    }
}
