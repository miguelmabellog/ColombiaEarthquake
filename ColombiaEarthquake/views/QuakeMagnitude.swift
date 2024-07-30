//
//  QuakeMagnitude.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//
import SwiftUI

struct QuakeMagnitude: View {
    var quake: Quake

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.black)
            .frame(width: 80, height: 60)
            .overlay {
                Text("\(quake.magnitude.formatted(.number.precision(.fractionLength(1))))")
                    .font(.title)
                    .bold()
                    .foregroundStyle(quake.color)
            }
    }
}

struct QuakeMagnitude_Previews: PreviewProvider {
    static var previewQuake = Quake(place: "Shakey Acres", magnitude: 1.0,
                                    time: "time",
                                    quakeid: "nc73649170",
                                    longitude: 0,
                                    latitude: 0)
    static var previews: some View {
        QuakeMagnitude(quake: previewQuake)
    }
}
