//
//  FetchMunicipalityUseCase.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 8/08/24.
//

import Foundation

protocol FetchMunicipalityUseCaseProtocol {
    func execute(departmentId:Int) async throws -> [Municipio]
}

class FetchMunicipalityUseCase: FetchMunicipalityUseCaseProtocol {
    private let provider: QuakesProvider
    
    init(provider: QuakesProvider) {
        self.provider = provider
    }
    
    func execute(departmentId:Int) async throws -> [Municipio] {
        try await provider.fetchMunicipios(for: departmentId )
        return provider.municipios
    }
}

class FetchMunicipalityUseCase2: UseCaseProtocol {
    typealias Input = Int
    typealias Output = [Municipio]
    
    private let quakesRepository: QuakesRepositoryProtocol
    
    init(quakesRepository: QuakesRepositoryProtocol) {
        self.quakesRepository = quakesRepository
    }
    
    func execute(input: Int?) async throws -> [Municipio] {
        guard let departmentId = input else {
            throw NSError(domain: "Invalid Input", code: 1, userInfo: nil)
        }
        return try await quakesRepository.fetchMunicipios(departmentId: departmentId)
    }
}
