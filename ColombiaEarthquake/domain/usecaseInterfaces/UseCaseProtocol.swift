//
//  UseCaseProtocol.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 12/08/24.
//

import Foundation

protocol UseCaseProtocol {
    associatedtype Input
    associatedtype Output
    
    func execute(input: Input?) async throws -> Output
}
protocol UseCaseProtocol2 {
    associatedtype Input
    associatedtype Output

    func execute(input: Input?) async -> Result<Output?, Error>
}
