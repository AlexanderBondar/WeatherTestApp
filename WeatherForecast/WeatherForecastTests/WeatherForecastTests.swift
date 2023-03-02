//
//  WeatherForecastTests.swift
//  WeatherForecastTests
//
//  Created by dev on 02.03.2023.
//

import XCTest
@testable import WeatherForecast

final class WeatherForecastTests: XCTestCase {

    lazy var responce: WeatherModel = {
        let data = extractDataFromJsonFile(
            withName: "WeatherResponce",
            bundleToken: WeatherForecastTests.self
        )
        return try! JSONDecoder().decode(WeatherDTO.self, from: data).asDomain()
    }()
    
    lazy var useCaseMock = WeatherForecastUseCaseStub(responceMock: responce)

    func testResponse() throws {

        let viewModel = HomeScreenViewModel(useCase: useCaseMock)
        
        XCTAssertTrue(viewModel.dataSource.sections.isEmpty)

        viewModel.fetchData()
        
        XCTAssertFalse(viewModel.dataSource.sections.isEmpty)
    }
}
