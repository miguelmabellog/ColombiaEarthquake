//
//  UserPreferencesRepository.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 12/08/24.
//

import Foundation

protocol UserPreferencesRepositoryProtocol {
    func fetchPreferencesQuakeByPlace() -> FetchBackgroundQuakeByPlaceModel
    func fetchPreferencesLastQuakeColombia() -> FetchBackgroundLastQuakeColombiaModel
    func setBoolPreference(for key: String, value: Bool) -> Bool
    func setStringPreference(for key: String, value: String?) -> Bool
    
    func fetchIsNotificationLastQuakeColombiaEnable() -> Bool
    
    func fetchIsNotificationQuakeByPlaceEnable() -> Bool
}


