//
//  QuakeDetail.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//

/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct QuakeDetail: View {
    var quake: Quake
    @EnvironmentObject private var quakesProvider: QuakesProvider
    @State private var location: QuakeLocation? = nil
    
    
    
    var body: some View {
        VStack {
            if let location = self.location {
                QuakeDetailMap(location: location, tintColor: quake.color)
                    .ignoresSafeArea(.container)
            }
            QuakeMagnitude(quakeMagnitude: quake.magnitude, quakeColor: quake.color)
            Text(quake.place)
                .font(.title3)
                .bold()
            Text("\(quake.time)")
                .foregroundStyle(Color.secondary)
            if let location = self.location {
                Text("Latitude: \(location.latitude.formatted(.number.precision(.fractionLength(3))))")
                Text("Longitude: \(location.longitude.formatted(.number.precision(.fractionLength(3))))")
            }
        }
        .task {
            self.location = QuakeLocation(quake:self.quake)
        }
    }
}


