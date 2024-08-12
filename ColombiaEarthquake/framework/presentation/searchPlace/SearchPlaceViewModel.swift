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
    
    
    @Published private var error: QuakeError?
    @Published var isLoading=false
    @Published var isErrorLoading=false
    
    private var cancellables = Set<AnyCancellable>()
    
    private let fetchDepartamentsUseCase: FetchDepartamentsUseCaseProtocol
    private let fetchMunicipalityUseCase: FetchMunicipalityUseCaseProtocol
    private let fetchPopulatedCenterUseCase: FetchPopulatedCenterUseCaseProtocol
        
        
    
    init(fetchDepartamentsUseCase: FetchDepartamentsUseCaseProtocol,
         fetchMunicipalityUseCase: FetchMunicipalityUseCaseProtocol,
         fetchPopulatedCenterUseCase: FetchPopulatedCenterUseCaseProtocol
    ) {
        self.fetchDepartamentsUseCase = fetchDepartamentsUseCase
        self.fetchMunicipalityUseCase = fetchMunicipalityUseCase
        self.fetchPopulatedCenterUseCase = fetchPopulatedCenterUseCase
    }
    
    
    
    func fetchDepartamentos() async throws {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do {
            DispatchQueue.main.async {
                self.isErrorLoading = false
            }
            
            let departamentos = try await fetchDepartamentsUseCase.execute()
            
            DispatchQueue.main.async {
                self.departamentos = departamentos
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isErrorLoading = true
                self.isLoading = false
            }
            print("Error fetching departamentos: \(error)")
        }
    }
    
    func fetchMunicipios() async {
        if let department = selectedDepartment {
            DispatchQueue.main.async {
                self.isLoading = true
            }
            do {
                DispatchQueue.main.async {
                    self.isErrorLoading = false
                }
                let municipios = try await fetchMunicipalityUseCase.execute(departmentId: Int(department.id) ?? 0)
                DispatchQueue.main.async {
                    print("dertamentoid: \(department.id)")
                    print("municipios: \(municipios)")
                    self.municipios = municipios
                    self.isErrorLoading = false
                    self.isLoading = false
                }
            } catch {
                print("Error fetching municipios: \(error)")
                DispatchQueue.main.async {
                    self.isErrorLoading = true
                    self.isLoading = false
                }
            }
        }
    }
    
    func fetchCentrosPoblados() async {
        if let municipality = selectedMunicipality {
            DispatchQueue.main.async {
                self.isLoading = true
            }
            do {
                DispatchQueue.main.async {
                    self.isErrorLoading = false
                }
                let centrosPoblados = try await fetchPopulatedCenterUseCase.execute(municipalityId: Int(municipality.id) ?? 0)
                DispatchQueue.main.async {
                    self.centrosPoblados = centrosPoblados
                    self.isErrorLoading = false
                    self.isLoading = false
                }
            } catch {
                print("Error fetching centros poblados: \(error)")
                DispatchQueue.main.async {
                    self.isErrorLoading = true
                    self.isLoading = false
                }
            }
        }

    }
}
