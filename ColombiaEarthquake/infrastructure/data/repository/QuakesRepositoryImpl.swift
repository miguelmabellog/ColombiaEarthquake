//
//  QuakesRepository.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 10/08/24.
//

import Foundation


class QuakesRepositoryImpl: QuakesRepositoryProtocol{
    
    let client: QuakeClient
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
    
    
    func fetchQuakes() async throws -> [Quake] {
        return try await client.quakes
    }
    
    func fetchDepartamentos() async throws -> [Departamento] {
        return try await client.departamentos
    }
    
    func fetchMunicipios(departmentId: Int) async throws -> [Municipio] {
        return try await client.municipios(for: departmentId)
    }
    
    func fetchCentrosPoblados(municipalityId: Int) async throws -> [CentroPoblado] {
        return try await client.centrosPoblados(for: municipalityId)
    }
    
    func fetchLastByPlace(municipalityId: Int) async throws -> [CentroPoblado] {
        return try await client.centrosPoblados(for: municipalityId)
    }
    
    func fetchQuakesByPlace(municipalityId: Int) async throws -> [QuakeByPlace] {
        return try await client.quakesByPlaces(for: municipalityId)
    }


    
    
}
