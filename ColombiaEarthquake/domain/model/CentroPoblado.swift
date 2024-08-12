//
//  CentrosPoblados.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import Foundation


struct CentroPoblado {
    let name: String
    let identify: String
    let type: String
    
}

extension CentroPoblado: Identifiable,Hashable {
    var id:  String{identify}
}

extension CentroPoblado: Decodable {
    private enum CodingKeys: String, CodingKey {
        case nombre
        case id
        case tipo
        
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawName = try? values.decode(String.self, forKey: .nombre)
        let rawId = try? values.decode(String.self, forKey: .id)
        let rawType = try? values.decode(String.self, forKey: .tipo)
        
        
        guard
            let name = rawName,
            let id = rawId,
            let type = rawType
        else {
            throw QuakeError.missingData
        }
        
        self.name = name
        self.identify = id
        self.type = type
    }
}
