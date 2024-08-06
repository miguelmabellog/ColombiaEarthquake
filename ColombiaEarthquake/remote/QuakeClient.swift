//
//  QuakeClient.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 23/07/24.
//

import Foundation

class QuakeClient {


    var quakes: [Quake] {
        get async throws {
            let data = try await downloader.httpData(from: feedURL)
            let allQuakes = try decoder.decode(QuakesData.self, from: data)
            return allQuakes.quakes
        }
    }
    
    
    var departamentos: [Departamento] {
        get async throws {
            let data = try await downloader.httpData(from: departamentosURL)
            let allDepartamentos = try decoder.decode(DepartamentosData.self, from: data)
            return allDepartamentos.departamentos
        }
    }
    
    func municipios(for idDepartamento: Int) async throws -> [Municipio] {
        let municipioURL = URL(string: "https://sismosentido.sgc.gov.co/EvaluacionIntensidadesServlet?metodo=cargarMunicipios&idDepartamento=\(idDepartamento)")!
        let data = try await downloader.httpData(from: municipioURL)
        let allMunicipios = try decoder.decode(MunicipiosData.self, from: data)
        return allMunicipios.municipios
    }
    
    func centrosPoblados(for idMunicipio: Int) async throws -> [CentroPoblado] {
        let centroPobladoURL = URL(string: "https://sismosentido.sgc.gov.co/EvaluacionIntensidadesServlet?metodo=cargarCentrosPoblados&idCabecera=\(idMunicipio)")!
        let data = try await downloader.httpData(from: centroPobladoURL)
        let allCentrosPoblados = try decoder.decode(CentrosPobladosData.self, from: data)
        return allCentrosPoblados.centrosPoblados
    }
    
    func quakesByPlaces(for idCentroPoblados: Int) async throws -> [QuakeByPlace] {
        let quakeByPlaceURL = URL(string: "https://sismosentido.sgc.gov.co/rest/sismosConsultaCentroPoblado/\(idCentroPoblados)")!
        let data = try await downloader.httpData(from: quakeByPlaceURL)
        let allQuakesByPlaces = try decoder.decode(QuakesByPlacesData.self, from: data)
        return allQuakesByPlaces.quakesByPlaces
    }
    


    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()


    private let feedURL = URL(string: "https://sismosentido.sgc.gov.co/rest/resumenSismosConIntensidadBatch/100")!
    
    private let departamentosURL = URL(string: "https://sismosentido.sgc.gov.co/EvaluacionIntensidadesServlet?metodo=cargarDepartamentos")!
    
    


    private let downloader: any HTTPDataDownloader


    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}
