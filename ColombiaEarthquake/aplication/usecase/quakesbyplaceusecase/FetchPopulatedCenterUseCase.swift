//
//  FetchPopulatedCenterUseCase.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 8/08/24.
//

import Foundation

protocol FetchPopulatedCenterUseCaseProtocol {
    func execute(municipalityId:Int) async throws -> [CentroPoblado]
}

class FetchPopulatedCenterUseCase: FetchPopulatedCenterUseCaseProtocol {
    private let provider: QuakesProvider
    
    init(provider: QuakesProvider) {
        self.provider = provider
    }
    
    func execute(municipalityId:Int) async throws -> [CentroPoblado] {
        try await provider.fetchCentrosPoblados(for: municipalityId )
        return provider.centrosPoblados
    }
}
