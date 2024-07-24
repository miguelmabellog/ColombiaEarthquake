//
//  GeoJson.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 22/07/24.
//

import Foundation



struct QuakeData: Decodable {
    let quakes: [Quake]
    
    // Custom init to decode using a container
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var quakesArray = [Quake]()
        
        while !container.isAtEnd {
            let quake = try container.decode(Quake.self)
            quakesArray.append(quake)
        }
        
        self.quakes = quakesArray
    }
}
