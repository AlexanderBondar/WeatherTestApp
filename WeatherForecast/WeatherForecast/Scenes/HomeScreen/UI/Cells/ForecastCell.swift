//
//  ForecastCell.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import UIKit

final class ForecastCell: UITableViewCell {
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) { nil }
    
    func configure(_ viewModel: CellModelProtocol) {
        guard
            let viewModel = viewModel as? ForecastCellModel
        else {
            return
        }
        textLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
        textLabel?.text = viewModel.temperature
        detailTextLabel?.text = viewModel.date
        imageView?.image = viewModel.image
    }
}
