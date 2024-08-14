//
//  TestDownloader.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 23/07/24.
//

import Foundation

@testable import ColombiaEarthquake

//class TestDownloader: HTTPDataDownloader {
//    func httpData(from url: URL) async throws -> Data {
//        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
//        return testQuakesByPlaces
//    }
//}

class TestDownloader: HTTPDataDownloader {
    
    static let idDepartamentoBogota: Int = 11
    static let idMunicipalityBogota: Int = 11001
    static let idPopulatedCenterBogota: Int = 11001000
    
    enum TestDownloaderError: Error {
        case unknownURL
    }
    
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))

        switch url.absoluteString {
        case "https://sismosentido.sgc.gov.co/rest/resumenSismosConIntensidadBatch/100":
            return mockAllQuakesColombia
        case "https://sismosentido.sgc.gov.co/EvaluacionIntensidadesServlet?metodo=cargarDepartamentos":
            return mockDepartments
        case "https://sismosentido.sgc.gov.co/EvaluacionIntensidadesServlet?metodo=cargarMunicipios&idDepartamento=\(TestDownloader.idDepartamentoBogota)":
            return mockMunicipality
        case "https://sismosentido.sgc.gov.co/EvaluacionIntensidadesServlet?metodo=cargarCentrosPoblados&idCabecera=\(TestDownloader.idMunicipalityBogota)":
            return mockPopulatedCenters
        case "https://sismosentido.sgc.gov.co/rest/sismosConsultaCentroPoblado/\(TestDownloader.idPopulatedCenterBogota)":
            return mockQuakesByPlaces
        default:
            throw TestDownloaderError.unknownURL
        }
    }
}

