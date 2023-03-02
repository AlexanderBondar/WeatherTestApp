//
//  JSONData.swift
//  WeatherForecast
//
//  Created by dev on 02.03.2023.
//

import Foundation

func extractDataFromJsonFile(
    withName name: String,
    bundleToken: AnyClass
) -> Data {
    let bundle = Bundle(for: bundleToken)
    return extractDataFromJsonFile(
        withName: name,
        inBundle: bundle
    )
}

func extractDataFromJsonFile(
    withName name: String,
    inBundle bundle: Bundle
) -> Data {
    if !bundle.isLoaded {
        bundle.load()
    }
    
    guard
        let url = bundle.url(
            forResource: name,
            withExtension: "json"
        )
    else {
        assertionFailure()
        return Data()
    }

    do {
        let data = try Data(contentsOf: url)
        
        let json = try? JSONSerialization.jsonObject(with: data)
        
        if json != nil {
            return data
        } else {
            assertionFailure()
            
            return Data()
        }
    } catch {
        assertionFailure()
        
        return Data()
    }
}
