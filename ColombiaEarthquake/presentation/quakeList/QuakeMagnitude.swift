//
//  QuakeMagnitude.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//
import SwiftUI

struct QuakeMagnitude: View {
    var quakeMagnitude: Double
    var quakeColor: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.black)
            .frame(width: 80, height: 60)
            .overlay {
                Text("\(quakeMagnitude.formatted(.number.precision(.fractionLength(1))))")
                    .font(.title)
                    .bold()
                    .foregroundStyle(quakeColor)
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
        QuakeMagnitude(quakeMagnitude: previewQuake.magnitude, quakeColor: previewQuake.color)
    }
}
