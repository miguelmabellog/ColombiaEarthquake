//
//  BackgroundFetchQuakeByPlaceUseCase.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 12/08/24.
//

import Foundation

class BackgroundFetchQuakeByPlaceUseCase: UseCaseProtocol {
    
    private let userPreferencesrepository: UserPreferencesRepositoryProtocol
    private let quakesRepository: QuakesRepositoryProtocol
    
    init(userPreferencesrepository: UserPreferencesRepositoryProtocol,quakesRepository:QuakesRepositoryProtocol) {
        self.userPreferencesrepository = userPreferencesrepository
        self.quakesRepository = quakesRepository
    }
    
    func execute(input: Void?) async throws -> BackgroundFetchQuakeByPlaceResult {
        let userPreferences=userPreferencesrepository.fetchPreferencesQuakeByPlace()
        
        var result = BackgroundFetchQuakeByPlaceResult(
            quakeByPlace: nil,
            isNewData: false
        )
        
        
        guard let lastPopulatedCenterId = userPreferences.lastPopulatedCenterId else {
            print("Error: `lastPopulatedCenterId` is `nil`")
            return result
        }
        let quakesByPlaces=try await quakesRepository.fetchQuakesByPlace(municipalityId: Int(lastPopulatedCenterId) ?? 0)
        
        let lastQuakeByPlaceId = userPreferences.lastQuakeByPlaceId
        
        let containsQuake = quakesByPlaces.contains { quake in
            quake.quakebyplaceid == lastQuakeByPlaceId
        }
        
        if containsQuake {
            if quakesByPlaces.first?.id == lastQuakeByPlaceId{
                result.isNewData=false
            }else{
                result.isNewData=true
                result.quakeByPlace=quakesByPlaces.first
            }
        }
        
        
        
        return result
        
    }
}

struct BackgroundFetchQuakeByPlaceResult{
    var quakeByPlace:QuakeByPlace?
    var isNewData:Bool
}
