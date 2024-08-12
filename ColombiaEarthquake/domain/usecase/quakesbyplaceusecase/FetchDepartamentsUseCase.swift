//
//  FetchDepartamentsUseCase.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 8/08/24.
//

import Foundation


protocol FetchDepartamentsUseCaseProtocol {
    func execute() async throws -> [Departamento]
}

class FetchDepartamentsUseCase: FetchDepartamentsUseCaseProtocol {
    
    private let provider: QuakesProvider
    
    init(provider: QuakesProvider) {
        self.provider = provider
    }
    
    func execute() async throws -> [Departamento] {
        try await provider.fetchDepartamentos()
        return provider.departamentos
    }
}

class FetchDepartamentsUseCase2: UseCaseProtocol {
    typealias Input = Void
    typealias Output = [Departamento]
    
    private let repository: QuakesRepositoryProtocol
    
    init(repository: QuakesRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(input: Void?) async throws -> [Departamento] {
        return try await repository.fetchDepartamentos()
    }
}
