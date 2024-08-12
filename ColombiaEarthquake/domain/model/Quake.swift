//
//  quake.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 19/07/24.
//





import Foundation

struct Quake {
    let place: String
    let magnitude: Double
    let time: String
    let quakeid: String
    let longitude: Double
    let latitude: Double
}

extension Quake: Identifiable {
    var id:  String{quakeid}
}

extension Quake: Decodable {
    private enum CodingKeys: String, CodingKey {
        case SITIO
        case MAGNITUD
        case FECHA
        case ID
        case LONGITUD
        case LATITUD
        
    }
    

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawPlace = try? values.decode(String.self, forKey: .SITIO)
        let rawMagnitude = try? values.decode(Double.self, forKey: .MAGNITUD)
        let rawDate = try? values.decode(String.self, forKey: .FECHA)
        let rawQuakeId = try? values.decode(String.self, forKey: .ID)
        let rawLongitude = try? values.decode(Double.self, forKey: .LONGITUD)
        let rawLatitude = try? values.decode(Double.self, forKey: .LATITUD)
        
        guard
              let place = rawPlace,
              let magnitude = rawMagnitude,
              let date = rawDate,
              let quakeId = rawQuakeId,
              let longitude = rawLongitude,
              let latitude = rawLatitude
        else {
            throw QuakeError.missingData
        }

        self.place = place
        self.magnitude = magnitude
        self.time = date
        self.quakeid = quakeId
        self.latitude = latitude
        self.longitude = longitude
    }
}


