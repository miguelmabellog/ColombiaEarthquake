//
//  DetailedPlaceEarthquake.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import SwiftUI

struct DetailedPlaceEarthquake: View {
    let centroPobladoId: String
    
    var body: some View {
        VStack {
            Text("Detalle del Centro Poblado")
                .font(.largeTitle)
                .padding()
            
            Text("ID del Centro Poblado: \(centroPobladoId)")
                .font(.title)
                .padding()
            
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detalle")
    }
}

struct DetailedPlaceEarthquake_Previews: PreviewProvider {
    static var previews: some View {
        DetailedPlaceEarthquake(centroPobladoId: "123")
    }
}
