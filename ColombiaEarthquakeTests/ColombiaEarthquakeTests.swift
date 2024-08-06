//
//  ColombiaEarthquakeTests.swift
//  ColombiaEarthquakeTests
//
//  Created by miguel angel bello garcia on 20/07/24.
//

import XCTest
@testable import ColombiaEarthquake

class ColombiaEarthquakeTests: XCTestCase {
    
    func testGeoJSONDecoderDecodesQuake() throws {
        let decoder = JSONDecoder()
        let quake = try decoder.decode(Quake.self, from: testFeature_nc73649170)
        
        XCTAssertEqual(quake.id, "SGC2024onitvr")
        
    }
    
    
    
    func testQuakesData() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(QuakesData.self, from: testColombiaQuakesData)
        
        XCTAssertEqual(decoded.quakes.count, 3)
        
    }
    
    func testDecoderDepartamento() throws {
        let decoder = JSONDecoder()
        let departamento = try decoder.decode(Departamento.self, from: testDepartamentoModel)
        
        XCTAssertEqual(departamento.id, "91")
        
    }
    
    func testDepartamentosData() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(DepartamentosData.self, from: testDepartamentos)
        
        XCTAssertEqual(decoded.departamentos.count, 33)
        
        
    }
    
    func testDecoderMunicipio() throws {
        let decoder = JSONDecoder()
        let departamento = try decoder.decode(Municipio.self, from: testMunicipioModel)
        
        XCTAssertEqual(departamento.id, "8078")
        
    }
    
    func testMunicipiosData() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(MunicipiosData.self, from: testMunicipios)
        
        XCTAssertEqual(decoded.municipios.count, 23)
        
        
    }
    
    func testDecoderCentroPoblado() throws {
        let decoder = JSONDecoder()
        let centroPoblado = try decoder.decode(CentroPoblado.self, from: testCentroPobladoModel)
        
        XCTAssertEqual(centroPoblado.id, "8001000")
        
    }
    
    func testCentrosPobladosData() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(CentrosPobladosData.self, from: testCentrosPoblados)
        
        XCTAssertEqual(decoded.centrosPoblados.count, 10)
        
        
    }
    
    func testDecoderQuakeByPlace() throws {
        let decoder = JSONDecoder()
        let quakeByPlace = try decoder.decode(QuakeByPlace.self, from: testQuakeByPlaceModel)
        
        XCTAssertEqual(quakeByPlace.quakebyplaceid, "SGC2024oyzvpl")
        
    }
    
    func testQuakePlacesData() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(QuakesByPlacesData.self, from: testQuakesByPlaces)
        
        XCTAssertEqual(decoded.quakesByPlaces.count, 11)
        
        
    }
    
    
    
    func testClientDoesFetchEarthquakeData() async throws {
        let downloader = TestDownloader()
        let client = QuakeClient(downloader: downloader)
        let quakes = try await client.quakes
        
        
        XCTAssertEqual(quakes.count, 10)
    }
    
}
