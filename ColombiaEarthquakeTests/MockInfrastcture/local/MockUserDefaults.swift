//
//  MockUserDefaults.swift
//  ColombiaEarthquakeTests
//
//  Created by miguel angel bello garcia on 13/08/24.
//

import Foundation

import Foundation

class MockUserDefaults: UserDefaults {
    private var mockStore = [String: Any]()
    
    override func set(_ value: Any?, forKey defaultName: String) {
        mockStore[defaultName] = value
    }
    
    override func string(forKey defaultName: String) -> String? {
        return mockStore[defaultName] as? String
    }
    
    override func bool(forKey defaultName: String) -> Bool {
        return mockStore[defaultName] as? Bool ?? false
    }
    
    // Puedes agregar otros métodos de UserDefaults que necesites mockear.
}

