//
//  MunicipiosData.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import Foundation


struct MunicipiosData: Decodable {
    let municipios: [Municipio]
    
    // Custom init to decode using a container
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var municipiosArray = [Municipio]()
        
        while !container.isAtEnd {
            let municipio = try container.decode(Municipio.self)
            municipiosArray.append(municipio)
        }
        
        self.municipios = municipiosArray
    }
}
