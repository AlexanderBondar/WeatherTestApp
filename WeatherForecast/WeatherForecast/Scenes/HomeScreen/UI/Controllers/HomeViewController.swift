//
//  HomeViewController.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import UIKit

final class HomeViewController: UITableViewController {
    
    // MARK: - Private properties

    private lazy var refreshControll: UIRefreshControl = {
        let refresh = UIRefreshControl()
        
        refresh.addTarget(
            self,
            action: #selector(refreshAction),
            for: .valueChanged
        )
        
        return refresh
    }()
    
    
    private var viewModel: HomeScreenViewModel
    
    // MARK: - Init
    
    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }

    
    // MARK: - Actions
    
    @objc private func refreshAction() {
//        viewModel.refresh()
    }
}
