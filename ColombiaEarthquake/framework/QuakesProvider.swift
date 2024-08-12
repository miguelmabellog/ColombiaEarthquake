//
//  QuakesProvider.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//

import Foundation


class QuakesProvider: ObservableObject {
    
    
    @Published var quakes: [Quake] = []
    
    @Published var departamentos: [Departamento] = []
    
    @Published var municipios: [Municipio] = []
    
    @Published var centrosPoblados: [CentroPoblado] = []
    
    @Published var quakesByPlaces: [QuakeByPlace] = []
    
        


    let client: QuakeClient
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }


    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        
        DispatchQueue.main.async {
            self.quakes = latestQuakes
        }
    }
    
    func fetchDepartamentos() async throws {
        let departamentos = try await client.departamentos
        
        DispatchQueue.main.async {
            self.departamentos = departamentos
        }
    }
    
    func fetchMunicipios(for idDepartamento: Int) async throws {
            let municipios = try await client.municipios(for: idDepartamento)
            
            DispatchQueue.main.async {
                self.municipios = municipios
            }
        }
    
    func fetchCentrosPoblados(for idMunicipio: Int) async throws {
        let centrosPoblados = try await client.centrosPoblados(for: idMunicipio)
        
        DispatchQueue.main.async {
            self.centrosPoblados = centrosPoblados
        }
    }
    
    func fetchLastByPlace(for idMunicipio: Int) async throws {
        let centrosPoblados = try await client.centrosPoblados(for: idMunicipio)
        
        DispatchQueue.main.async {
            self.centrosPoblados = centrosPoblados
        }
    }
    
    func fetchQuakesByPlace(for idCentroPoblado: Int) async throws {
        print("fetch id \(idCentroPoblado)")
        let quakesByPlaces = try await client.quakesByPlaces(for: idCentroPoblado)
        
        DispatchQueue.main.async {
            self.quakesByPlaces = quakesByPlaces
            print("fetch quakes \(quakesByPlaces.count)")
        }
    }


    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }


    
}
