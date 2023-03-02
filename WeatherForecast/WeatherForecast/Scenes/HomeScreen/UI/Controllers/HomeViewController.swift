//
//  HomeViewController.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import UIKit

final class HomeViewController: UITableViewController {
    
    // MARK: - Nested Types
    
    private enum Consts {
        enum Strings {
            static let title = "Weather forecast"
        }
    }
    
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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
     
        registerCells()
        setupUI()
        bindToData()
        viewModel.fetchData()
    }
    
    required init?(coder: NSCoder) { nil }

    
    // MARK: - Actions
    
    @objc private func refreshAction() {
//        viewModel.refresh()
    }
    
    // MARK: - Private methods
    
    private func bindToData() {
        tableView.dataSource = viewModel.dataSource
        viewModel.onUpdateDataSource = { [weak self] in
            self?.tableView.reloadData()
        }
    }

    private func registerCells() {
        tableView.register(CityCell.self)
        tableView.register(ForecastCell.self)
    }
    
    private func setupUI() {
        tableView.dataSource = viewModel.dataSource
        title = Consts.Strings.title
    }
}
