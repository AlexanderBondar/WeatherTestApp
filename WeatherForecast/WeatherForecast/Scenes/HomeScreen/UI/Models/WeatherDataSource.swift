//
//  WeatherDataSource.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import UIKit

final class WeatherDataSource: NSObject {
    
    // MARK: - Private properties

    var sections: [SectionModel] = []
    
    func update(_ model: WeatherModel) {
        sections = [
            SectionModel(
                type: .city,
                cells: [CityCellModel(model: model.location)]
            ),
            SectionModel(
                type: .forecast,
                cells: model.forecast.forecastDays.map({ ForecastCellModel(model: $0) })
            )
        ]
    }
}

extension WeatherDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        guard sections.indices.contains(section) else { return 0 }
        
        return sections[section].cells.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            sections.indices.contains(indexPath.section),
            sections[indexPath.section].cells.indices.contains(indexPath.row)
        else {
            return UITableViewCell()
        }
        
        let model = sections[indexPath.section].cells[indexPath.row]
        switch sections[indexPath.section].type {
            case .city:
                let cell = tableView.dequeue(CityCell.self, forIndexPath: indexPath)
                cell.configure(model)
                return cell
            case .forecast:
                let cell = tableView.dequeue(ForecastCell.self, forIndexPath: indexPath)
                cell.configure(model)
                return cell
        }
    }
}
