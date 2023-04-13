//
//  CoreDataRepository.swift
//  WeatherForecast
//
//  Created by dev on 22.03.2023.
//

import Foundation
import CoreData

class CoreDataRepository: StorageRepository {

    // MARK: - Private properties

    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ForecastModel")
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                assertionFailure("Unresolved error \(error), \(error.userInfo)")
            } else {
                let description = NSPersistentStoreDescription()
                description.shouldMigrateStoreAutomatically = false
                description.shouldInferMappingModelAutomatically = true
                
                container.persistentStoreDescriptions = [description]
            }
        }
        
        return container
    }()
    
    // MARK: - Private methods
    
    private func saveContext() {
        guard container.viewContext.hasChanges else { return }
        
        do {
            try container.viewContext.save()
        } catch {
            // TODO: Handle and revert some data changes or adding an ability to resave.
            debugPrint("savingError: \(error)")
            assertionFailure()
        }
    }
        
    func getWeather() -> WeatherDTO? {
        
       let result = (try? container.viewContext.fetch(WeatherEntity.fetchRequest())) ?? []
       
        return result.first?.asDTO()
    }
    
    func saveWeather(_ weather: WeatherDTO) {
        removeLatest()
        
        let context = container.viewContext
        
        _ = WeatherEntity(weather, context: context)
        
        saveContext()
    }
    
    private func removeLatest() {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "WeatherEntity")
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        
        _ = try? container.viewContext.execute(delete)
    }
}
