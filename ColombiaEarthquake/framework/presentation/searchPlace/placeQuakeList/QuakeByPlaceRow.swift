//
//  QuakeByPlaceRow.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import SwiftUI

struct QuakeByPlaceRow: View {
    var quake: QuakeByPlace
    
    var body: some View {
        HStack {
            QuakeMagnitude(quakeMagnitude: quake.magnitude, quakeColor: quake.color)
            VStack(alignment: .leading) {
               
                Text("\(quake.time)")
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}


