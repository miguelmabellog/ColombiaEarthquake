//
//  FetchQuakesByPlaces.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 8/08/24.
//

import Foundation

protocol FetchQuakesByPlaceUseCaseProtocol {
    func execute(populatedCenterId:Int) async throws -> [QuakeByPlace]
}

class FetchQuakesByPlaceUseCase: FetchQuakesByPlaceUseCaseProtocol {
    private let provider: QuakesProvider
    
    init(provider: QuakesProvider) {
        self.provider = provider
    }
    
    func execute(populatedCenterId:Int) async throws -> [QuakeByPlace] {
        try await provider.fetchQuakesByPlace(for: populatedCenterId )
        print("quakes use case desde \(populatedCenterId)")
        print(provider.quakesByPlaces.count)
        return provider.quakesByPlaces
    }
}
