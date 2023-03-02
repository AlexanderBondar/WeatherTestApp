//
//  CityCell.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import UIKit

final class CityCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) { nil }
    
    func configure(_ viewModel: CellModelProtocol) {
        guard
            let viewModel = viewModel as? CityCellModel
        else {
            return
        }
        textLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        textLabel?.text = viewModel.cityName
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        detailTextLabel?.text = formatter.string(from: currentDateTime)
    }
}
