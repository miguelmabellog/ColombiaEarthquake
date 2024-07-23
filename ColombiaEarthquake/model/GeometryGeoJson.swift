//
//  Geometry.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 22/07/24.
//

import Foundation

struct GeometryGeoJson:Decodable{
    let street: [[String]]
    let city: String
    let zipcode: String
}

//extension Geometry {
//    private enum CodingKeys: String, CodingKey {
//        case Coordinates
//    }
//    
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        let rawCoordinates = try? values.decodeIfPresent([[Double]].self, forKey: .Coordinates)
//        
//
//        guard
//              let Coordinates = rawCoordinates
//        else {
//            throw QuakeError.missingData
//        }
//
//        self.Coordinates = Coordinates
//        self.longitude = Coordinates.first?.first ?? 0
//        self.latitude = Coordinates.first?.last ?? 0
//    }
//}
