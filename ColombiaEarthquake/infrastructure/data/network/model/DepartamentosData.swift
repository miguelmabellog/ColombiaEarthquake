//
//  DepartamentosData.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import Foundation

struct DepartamentosData: Decodable {
    let departamentos: [Departamento]
    
    // Custom init to decode using a container
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var departamentosArray = [Departamento]()
        
        while !container.isAtEnd {
            let departamento = try container.decode(Departamento.self)
            departamentosArray.append(departamento)
        }
        
        self.departamentos = departamentosArray
    }
}
