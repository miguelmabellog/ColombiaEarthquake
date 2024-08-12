//
//  CentroPobladosData.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import Foundation

struct CentrosPobladosData: Decodable {
    let centrosPoblados: [CentroPoblado]
    
    // Custom init to decode using a container
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var centrosPobladosArray = [CentroPoblado]()
        
        while !container.isAtEnd {
            let centroPoblado = try container.decode(CentroPoblado.self)
            centrosPobladosArray.append(centroPoblado)
        }
        
        self.centrosPoblados = centrosPobladosArray
    }
}
