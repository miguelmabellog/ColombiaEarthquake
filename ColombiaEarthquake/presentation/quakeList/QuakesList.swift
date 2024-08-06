//
//  Quakes.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//

import SwiftUI

struct QuakesList: View {
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
                List() {
                    ForEach(provider.quakes) { quake in
                        NavigationLink(destination: QuakeDetail(quake: quake)) {
                            QuakeRow(quake: quake)
                        }
                    }
                }
                .listStyle(.inset)
                .navigationTitle(title)
                .toolbar(content: toolbarContent)
                .refreshable {
                    do {
                        try await provider.fetchQuakes()
                    } catch {
                        self.error = QuakeError.missingData
                        hasError = true
                    }
                }
            }
        .task {
            await fetchQuakes()
        }
    }
}

extension QuakesList {
    var title: String {
        "Ultimos Terremotos"
    }
    
    func fetchQuakes() async {
        isLoading = true
        do {
            try await provider.fetchQuakes()
            lastUpdated = Date().timeIntervalSince1970
        } catch {
            self.error = error as? QuakeError ?? .unexpectedError(error: error)
            self.hasError = true
        }
        isLoading = false
    }
}

//struct Quakes_Previews: PreviewProvider {
//    static var previews: some View {
//        Quakes(showIntroduction: .constant(false))
//            .environmentObject(QuakesProvider(client: QuakeClient(downloader: TestDownloader())))
//    }
//}
