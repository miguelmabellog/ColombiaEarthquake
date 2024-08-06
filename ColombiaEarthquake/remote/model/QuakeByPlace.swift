//
//  QuakePlace.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import Foundation

struct QuakeByPlace {
    let magnitude: Double
    let time: String
    let quakebyplaceid: String
    let longitude: String
    let latitude: String
}

extension QuakeByPlace: Identifiable {
    var id:  String{quakebyplaceid}
}

extension QuakeByPlace: Decodable {
    private enum CodingKeys: String, CodingKey {
        case MAGNITUD
        case FECHA
        case ID_SISMO
        case LONGITUD
        case LATITUD
        
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawMagnitude = try? values.decode(Double.self, forKey: .MAGNITUD)
        let rawDate = try? values.decode(String.self, forKey: .FECHA)
        let rawQuakeByPlaceId = try? values.decode(String.self, forKey: .ID_SISMO)
        let rawLongitude = try? values.decode(String.self, forKey: .LONGITUD)
        let rawLatitude = try? values.decode(String.self, forKey: .LATITUD)
        
        guard
            
            let magnitude = rawMagnitude,
            let date = rawDate,
            let quakeId = rawQuakeByPlaceId,
            let longitude = rawLongitude,
            let latitude = rawLatitude
        else {
            throw QuakeError.missingData
        }
        
        self.magnitude = magnitude
        self.time = date
        self.quakebyplaceid = quakeId
        self.latitude = latitude
        self.longitude = longitude
    }
}
