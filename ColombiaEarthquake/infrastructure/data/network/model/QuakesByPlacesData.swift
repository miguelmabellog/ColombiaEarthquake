//
//  QuakesByPlaces.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import Foundation

struct QuakesByPlacesData: Decodable {
    let quakesByPlaces: [QuakeByPlace]
    
    // Custom init to decode using a container
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var quakeByPlacesArray = [QuakeByPlace]()
        
        while !container.isAtEnd {
            let quakeByPlace = try container.decode(QuakeByPlace.self)
            quakeByPlacesArray.append(quakeByPlace)
        }
        
        self.quakesByPlaces = quakeByPlacesArray
    }
}
