//
//  BackgroundTest.swift
//  ColombiaEarthquakeTests
//
//  Created by miguel angel bello garcia on 12/08/24.
//



import XCTest
@testable import ColombiaEarthquake



class BackgroundFetchQuakeByPlaceUseCaseTest: XCTestCase {
    
    var container: DependencyContainer!
    
    override func setUp() {
        super.setUp()
        container = DependencyContainer.shared
    }
    
    func testBackgroundFetchQuakeByPlaceUseCase() async {
        // Manipular mockUserDefaults a través del contenedor
        container.mockUserDefaults.set(nil, forKey: UserPreferencesKey.lastQuakeByPlaceId.rawValue)
        container.mockUserDefaults.set("432", forKey: UserPreferencesKey.lastPopulatedCenterId.rawValue)
        
        do {
            let result = try await container.backgroundFetchQuakeByPlaceUseCase.execute(input: nil)
            XCTAssertEqual(result.quakesByPlacesCount, 11)
            XCTAssertEqual(result.isNewData, true)
            
        } catch {
            print("Error al ejecutar el caso de uso: \(error)")
        }
    }
    
    }
