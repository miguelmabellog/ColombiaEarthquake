//
//  DetailedPlaceEarthquake.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import SwiftUI



struct PlaceEarthquake: View {
    let centroPobladoId: String
    let centroPobladoName: String
    @EnvironmentObject var provider: QuakesProvider

    @AppStorage("lastUpdated")
    var lastUpdated = Date.distantFuture.timeIntervalSince1970

    @State var isLoading = false
    @State private var error: QuakeError?
    @State private var hasError = false

    var body: some View {
        VStack{
            if isLoading {
                ProgressView()  // Animación de carga
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .padding(.vertical, 20)
            }
            
            if provider.quakesByPlaces.count == 0 && !isLoading {
                
                Text("No hay terremotos reportados")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 20)
            }
            List() {
                ForEach(provider.quakesByPlaces) { quake in
                    NavigationLink(destination: QuakeDetail(quake: Quake(place: centroPobladoName, magnitude: quake.magnitude, time: quake.time, quakeid: "", longitude: Double(quake.longitude) ?? 0, latitude: Double(quake.latitude) ?? 0))) {
                        QuakeByPlaceRow(quake: quake)
                    }
                    
                }
            }
            .listStyle(.inset)
            .navigationTitle(title)
            .refreshable {
                do {
                    try await provider.fetchQuakesByPlaces(for: Int(centroPobladoId) ?? 0 )
                } catch {
                    self.error = QuakeError.missingData
                    hasError = true
                }
            }}
        
        
            
        
        .task {
            await fetchQuakesByPlace()
        }
    }
}

extension PlaceEarthquake {
    var title: String {
        centroPobladoName
    }
    
    func fetchQuakesByPlace() async {
        isLoading = true
        do {
            try await provider.fetchQuakesByPlaces(for: Int(centroPobladoId) ??  0 )
            lastUpdated = Date().timeIntervalSince1970
        } catch {
            self.error = error as? QuakeError ?? .unexpectedError(error: error)
            self.hasError = true
        }
        isLoading = false
    }
    
    
}





