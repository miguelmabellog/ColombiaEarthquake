//
//  ColombiaEarthquakeApp.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 19/07/24.
//

import SwiftUI

@main
struct ColombiaEarthquakeApp: App {
    @StateObject var quakesProvider = QuakesProvider()
    @State private var showIntroduction = true
    var body: some Scene {
        WindowGroup {
            VStack{
                IntroductionView()
            }
                    .environmentObject(quakesProvider)
            
        }
    }
}
