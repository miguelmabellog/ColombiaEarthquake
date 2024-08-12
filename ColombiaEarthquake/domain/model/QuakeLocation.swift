//
//  QuakeLocation.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 19/07/24.
//

import Foundation


struct QuakeLocation: Decodable {
    var latitude: Double
    var longitude: Double
    
    
    init(quake:Quake) {
        self.latitude=quake.latitude
        self.longitude=quake.longitude
    }
}

