//
//  UserPreferences.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 12/08/24.
//

import Foundation



class UserPreferencesDataSource {
    private let userDefaults: UserDefaults
       
       init(userDefaults: UserDefaults = .standard) {
           self.userDefaults = userDefaults
       }
    
    var userPreferencesQuakeByPlace: FetchBackgroundQuakeByPlaceModel {
        return FetchBackgroundQuakeByPlaceModel(
            isNotificationQuakeByPlaceEnable: bool(forKey: .isNotificationQuakeByPlaceEnable),
            lastQuakeByPlaceName: string(forKey: .lastQuakeByPlaceName),
            lastQuakeByPlaceId: string(forKey: .lastQuakeByPlaceId),
            lastPopulatedCenterId: string(forKey: .lastPopulatedCenterId)
        )
    }
    
    var userPreferencesLastQuakeColombia: FetchBackgroundLastQuakeColombiaModel {
        return FetchBackgroundLastQuakeColombiaModel(
            isNotificationLastQuakeColombiaEnable: bool(forKey: .isNotificationLastQuakeColombiaEnable),
            lastColomiaQuakeId: string(forKey: .lastColomiaQuakeId)
        )
    }
    
    var isNotificationQuakeByPlaceEnable: Bool {
        return bool(forKey: .isNotificationQuakeByPlaceEnable)
        
    }
    
    var isNotificationLastQuakeColombiaEnable: Bool {
        return bool(forKey: .isNotificationLastQuakeColombiaEnable)
        
    }
    
    func setBoolPreference(for key: String, value: Bool) -> Bool {
        userDefaults.set(value, forKey: key)
        return userDefaults.bool(forKey: key) == value
    }
    
    func setStringPreference(for key: String, value: String?) -> Bool {
        userDefaults.set(value, forKey: key)
        return userDefaults.string(forKey: key) == value
    }
    
}

private extension UserPreferencesDataSource {
    func bool(forKey key: UserPreferencesKey) -> Bool {
        return userDefaults.bool(forKey: key.rawValue)
    }
    
    func string(forKey key: UserPreferencesKey) -> String? {
        return userDefaults.string(forKey: key.rawValue)
    }
}

enum UserPreferencesKey: String {
    case isNotificationQuakeByPlaceEnable = "isNotificationQuakeByPlaceEnable"
    case isNotificationLastQuakeColombiaEnable = "isNotificationLastQuakeColombiaEnable"
    case lastQuakeByPlaceName = "lastQuakeByPlaceName"
    case lastQuakeByPlaceId = "lastQuakeByPlaceId"
    case lastColomiaQuakeId = "lastColomiaQuakeId"
    case lastPopulatedCenterId = "lastPopulatedCenterId"
}
