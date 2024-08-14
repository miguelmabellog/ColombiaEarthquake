//
//  QuakesRepositoryProtocol.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 10/08/24.
//

import Foundation

protocol QuakesRepositoryProtocol{
    
    func fetchQuakes() async throws -> [Quake]
    
    func fetchDepartamentos() async throws -> [Departamento]
    
    func fetchMunicipios(departmentId: Int) async throws -> [Municipio]
    
    func fetchCentrosPoblados(municipalityId: Int) async throws -> [CentroPoblado]
    
    func fetchLastByPlace(municipalityId: Int) async throws -> [CentroPoblado]
    
    func fetchQuakesByPlace(populatedCenterId: Int) async throws -> [QuakeByPlace]

    
    
}
