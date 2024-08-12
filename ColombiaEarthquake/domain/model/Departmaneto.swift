//
//  Departmanetos.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import Foundation

struct Departamento {
    let name: String
    let identify: String
    
}

extension Departamento: Identifiable,Hashable {
    var id:  String{identify}
}

extension Departamento: Decodable {
    private enum CodingKeys: String, CodingKey {
        case nombre
        case id
        
    }
    

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawName = try? values.decode(String.self, forKey: .nombre)
        let rawId = try? values.decode(String.self, forKey: .id)
        
        
        guard
              let name = rawName,
              let id = rawId
        else {
            throw QuakeError.missingData
        }

        self.name = name
        self.identify = id
    }
}
