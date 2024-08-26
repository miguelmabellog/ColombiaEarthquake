//
//  QuakeListByPlaceDataModel.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 25/08/24.
//

import Foundation

struct QuakeListByPlaceDataModel{
    let populatedCenterId: String
    let populatedCenterName: String
    var quakesByPlace: [QuakeByPlace] = []
    
    
    var isLoading = false
    private var error: QuakeError?
    private var hasError = false
}
