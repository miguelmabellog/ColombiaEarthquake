//
//  Hidden.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 9/08/24.
//

import SwiftUI


extension View {
    func isHidden(_ hidden: Bool) -> some View {
        hidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
