//
//  FetchAllQuakesUseCase.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 10/08/24.
//

import Foundation

class FetchAllQuakesUseCase: UseCaseProtocol {
    typealias Input = Void
    typealias Output = [Quake]
    
    private let repository: QuakesRepositoryProtocol
    
    init(repository: QuakesRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(input: Void?) async throws -> [Quake] {
        return try await repository.fetchQuakes()
    }
}
