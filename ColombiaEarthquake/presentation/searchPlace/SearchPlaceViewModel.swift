//
//  SearchPlaceViewModel.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 6/08/24.
//

import SwiftUI
import Combine

class SearchPlaceViewModel: ObservableObject {
    @Published var departamentos: [Departamento] = []
    @Published var municipios: [Municipio] = []
    @Published var centrosPoblados: [CentroPoblado] = []
    
    @Published var selectedDepartment: Departamento? = nil
    @Published var selectedMunicipality: Municipio? = nil
    @Published var selectedPopulatedCenter: CentroPoblado? = nil
    
    private var provider: QuakesProvider
    private var cancellables = Set<AnyCancellable>()
    
    init(provider: QuakesProvider) {
        self.provider = provider
        bindProvider()
    }
    
    private func bindProvider() {
        provider.$departamentos
            .assign(to: \.departamentos, on: self)
            .store(in: &cancellables)
        
        provider.$municipios
            .assign(to: \.municipios, on: self)
            .store(in: &cancellables)
        
        provider.$centrosPoblados
            .assign(to: \.centrosPoblados, on: self)
            .store(in: &cancellables)
    }
    
    func fetchDepartamentos() async {
        do {
            try await provider.fetchDepartamentos()
        } catch {
            print("Error fetching departamentos: \(error)")
        }
    }
    
    func fetchMunicipios() async {
        if let department = selectedDepartment {
            do {
                try await provider.fetchMunicipios(for: Int(department.id) ?? 0)
            } catch {
                print("Error fetching municipios: \(error)")
            }
        }
    }
    
    func fetchCentrosPoblados() async {
        if let municipio = selectedMunicipality {
            do {
                try await provider.fetchCentrosPoblados(for: Int(municipio.id) ?? 0)
            } catch {
                print("Error fetching centros poblados: \(error)")
            }
        }
    }
}
