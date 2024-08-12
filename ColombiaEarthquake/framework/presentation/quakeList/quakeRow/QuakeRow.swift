//
//  QuakeRow.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//

import SwiftUI

struct QuakeRow: View {
    var quake: Quake
    
    var body: some View {
        HStack {
            QuakeMagnitude(quakeMagnitude: quake.magnitude,quakeColor: quake.color)
            VStack(alignment: .leading) {
                Text(quake.place)
                    .font(.title3)
                Text("\(quake.time)")
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct QuakeRow_Previews: PreviewProvider {
    static var previewQuake = Quake(place: "Shakey Acres",
                                    magnitude: 1.0,
                                    time: "time",
                                    quakeid: "nc73649170",
                                    longitude: 0,
                                    latitude: 0)
    
    static var previews: some View {
        QuakeRow(quake: previewQuake)
            .previewLayout(.sizeThatFits)
    }
}
