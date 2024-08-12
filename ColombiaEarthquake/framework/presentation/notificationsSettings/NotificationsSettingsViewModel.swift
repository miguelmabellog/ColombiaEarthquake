//
//  NotificationsSettingsViewModel.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 6/08/24.
//

import Foundation
import Combine


class NotificationsSettingsViewModel: ObservableObject {
    @Published var departamentos: [Departamento] = []
    @Published var municipios: [Municipio] = []
    @Published var centrosPoblados: [CentroPoblado] = []
    @Published var quakesByPlaces: [QuakeByPlace] = []
    
    @Published var selectedDepartment: Departamento? = nil
    @Published var selectedMunicipality: Municipio? = nil
    @Published var selectedPopulatedCenter: CentroPoblado? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published private var error: QuakeError?
    @Published var isLoading=false
    @Published var isErrorLoading=false
    
    private let fetchDepartamentsUseCase: FetchDepartamentsUseCaseProtocol
    private let fetchMunicipalityUseCase: FetchMunicipalityUseCaseProtocol
    private let fetchPopulatedCenterUseCase: FetchPopulatedCenterUseCaseProtocol
    private let fetchQuakeByPlaceUseCase: FetchQuakesByPlaceUseCaseProtocol
        
        
    
    init(fetchDepartamentsUseCase: FetchDepartamentsUseCaseProtocol,
         fetchMunicipalityUseCase: FetchMunicipalityUseCaseProtocol,
         fetchPopulatedCenterUseCase: FetchPopulatedCenterUseCaseProtocol,
         fetchQuakeByPlaceUseCase: FetchQuakesByPlaceUseCaseProtocol
    ) {
        self.fetchDepartamentsUseCase = fetchDepartamentsUseCase
        self.fetchMunicipalityUseCase = fetchMunicipalityUseCase
        self.fetchPopulatedCenterUseCase = fetchPopulatedCenterUseCase
        self.fetchQuakeByPlaceUseCase = fetchQuakeByPlaceUseCase
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
                    self.municipios = municipios
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
    
    func fetchQuakesByPlace() async {
        if let centroPoblado = selectedPopulatedCenter {
            DispatchQueue.main.async {
                self.isLoading = true
            }
            do {
                DispatchQueue.main.async {
                    self.isErrorLoading = false
                }
                print("centro poblado id \(centroPoblado.id)")
                let quakesByPlace = try await fetchQuakeByPlaceUseCase.execute(populatedCenterId: Int(centroPoblado.id) ?? 0)
                print("quakes by places \(quakesByPlace.count)")
                DispatchQueue.main.async {
                    self.quakesByPlaces = quakesByPlace
                    self.isErrorLoading = false
                    self.isLoading = false
                }
            } catch {
                print("Error fetching quakes by place: \(error)")
                DispatchQueue.main.async {
                    self.isErrorLoading = true
                    self.isLoading = false
                }
            }
        }

    }
    
    
}
