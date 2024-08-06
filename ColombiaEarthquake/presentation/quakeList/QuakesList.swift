//
//  Quakes.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//

import SwiftUI

struct QuakesList: View {
    @Binding var showIntroduction: Bool
    @StateObject private var viewModel: QuakesViewModel

    init(showIntroduction: Binding<Bool>, provider: QuakesProvider) {
        self._showIntroduction = showIntroduction
        self._viewModel = StateObject(wrappedValue: QuakesViewModel(provider: provider))
    }

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()  // Animación de carga
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                        .padding(.vertical, 20)
                }
                List(viewModel.quakes) { quake in
                    NavigationLink(destination: QuakeDetail(quake: quake)) {
                        QuakeRow(quake: quake)
                    }
                }
                .listStyle(.inset)
                .navigationTitle(viewModel.title)
                .toolbar(content: toolbarContent)
                .refreshable {
                    await viewModel.fetchQuakes()
                }
            }
        }
        .task {
            await viewModel.fetchQuakes()
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text("Error"), message: Text(viewModel.error?.localizedDescription ?? "Unknown error"), dismissButton: .default(Text("OK")))
        }
    }
}

//struct Quakes_Previews: PreviewProvider {
//    static var previews: some View {
//        Quakes(showIntroduction: .constant(false))
//            .environmentObject(QuakesProvider(client: QuakeClient(downloader: TestDownloader())))
//    }
//}
