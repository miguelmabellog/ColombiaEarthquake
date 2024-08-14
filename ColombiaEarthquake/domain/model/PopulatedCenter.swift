//
//  CentrosPoblados.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import Foundation


public struct populatedCenter {
    let name: String
    let identify: String
    let type: String
    
}

extension populatedCenter: Identifiable,Hashable {
    public var id:  String{identify}
}

extension populatedCenter: Decodable {
    private enum CodingKeys: String, CodingKey {
        case nombre
        case id
        case tipo
        
    }
    
    
    public init(from decoder: Decoder) throws {
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
