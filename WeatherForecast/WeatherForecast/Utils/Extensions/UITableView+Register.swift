//
//  UITableView+Register.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import UIKit

extension UITableViewCell: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }

public protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: T.self.reuseIdentifier) as? T
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: T.self.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Error: cell with id: \(T.self.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue header/footer view with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}
