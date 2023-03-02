//
//  StorageRepositoryImpl.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

// MARK: - StorageRepositoryImpl

final class StorageRepositoryImpl {
    
    // MARK: - Private properties
    
    private let userDefaults = UserDefaults.standard

}

// MARK: - StorageRepository 

extension StorageRepositoryImpl: StorageRepository {
    func getObject<T>(by type: T.Type) -> T? where T : Decodable, T : Encodable {
        do {
            return try userDefaults.getObject(castTo: type)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func saveObject(_ object: Codable) {
        do {
            try userDefaults.setObject(object)
        } catch {
            print(error.localizedDescription)
        }
    }
}
