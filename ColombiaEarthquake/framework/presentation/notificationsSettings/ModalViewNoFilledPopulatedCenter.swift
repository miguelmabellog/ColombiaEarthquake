//
//  ModalViewNoFilledPopulatedCenter.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 9/08/24.
//

import SwiftUI

struct ModalViewNoFilledPopulatedCenter: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Debes seleccionar un centro poblado")
                .font(.largeTitle)
                .padding()

            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
