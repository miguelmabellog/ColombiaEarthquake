//
//  RefreshButton.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//

import SwiftUI

struct RefreshButton: View {
    var action: () -> Void = {}
    var body: some View {
        Button(action: action) {
            Label("Actualizar", systemImage: "arrow.clockwise")
        }
    }
}

struct RefreshButton_Previews: PreviewProvider {
    static var previews: some View {
        RefreshButton()
            .previewLayout(.sizeThatFits)
    }
}
