//
//  NotificationSettingsView.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 6/08/24.
//

import SwiftUI

struct NotificationSettingsView: View {
    @AppStorage("lastEarthQuakeByPlace") private var lastEarthQuakeByPlace: String = ""
    @AppStorage("NotificationByPlaceIsOn") private var NotificationByPlaceIsOn: Bool = false
    @State private var toggle1: Bool = false
    @State private var toggle2: Bool = false
    
    @State private var selectedMagnitude: String = "Seleccionar"
    
    @StateObject private var viewModel: NotificationsSettingsViewModel
    @EnvironmentObject var provider: QuakesProvider
    
    init(provider: QuakesProvider) {
        _viewModel = StateObject(wrappedValue: NotificationsSettingsViewModel(provider: provider))
    }
    
    
    
    let MagnitudeLastEarthQuake = ["Seleccionar","2.0 a 2.5", "2.5 a 3.0", "3.0 a 3.5", "3.5 a 4.0","4.0 a 4.5", "4.5 a 5.0", "Mayor a 5.0"]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            CardView(title: "Noificacion Ultimo Terremoto", isOn: $toggle1)
            VStack(alignment: .leading) {
                Text("Magnitud")
                    .font(.headline)
                
                Picker("Magnitud", selection: $selectedMagnitude) {
                    ForEach(MagnitudeLastEarthQuake, id: \.self) { magnitude in
                        Text(magnitude).tag(magnitude)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            Spacer()
            Divider()
            
            HStack {
                Text("Notificacion Por Lugar")
                    .font(.title)
                Spacer()
                Toggle(isOn: $toggle2) {
                    Text("")
                }
                .onChange(of: toggle2) { newValue in
                    
                    
                    if newValue {
                        Task {
                            await viewModel.fetchQuakesByPlace()
                            lastEarthQuakeByPlace=viewModel.quakesByPlaces.first?.id ?? ""
                            NotificationByPlaceIsOn=true
                            print(viewModel.quakesByPlaces.first)
                        }
                    } else {
                        lastEarthQuakeByPlace=""
                        NotificationByPlaceIsOn=false
                        
                    }
                }
                .labelsHidden()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            
            
            
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading) {
                    Text("Departamento")
                        .font(.headline)
                    
                    Picker("Departamento", selection: $viewModel.selectedDepartment) {
                        Text("Selecciona un Departamento").tag(nil as Departamento?)
                        ForEach(provider.departamentos) { department in
                            Text(department.name).tag(department as Departamento?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: viewModel.selectedDepartment) { department in
                        if let department = department {
                            Task {
                                await viewModel.fetchMunicipios()
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Municipio")
                        .font(.headline)
                    
                    Picker("Municipios", selection: $viewModel.selectedMunicipality) {
                        Text("Selecciona un Municipio").tag(nil as Municipio?)
                        ForEach(provider.municipios) { municipio in
                            Text(municipio.name).tag(municipio as Municipio?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: viewModel.selectedMunicipality) { municipio in
                        if let municipio = municipio {
                            Task {
                                await viewModel.fetchCentrosPoblados()
                            }
                        }
                    }
                }
                
                
                VStack(alignment: .leading) {
                    Text("Centro Poblado")
                        .font(.headline)
                    
                    Picker("Centro Poblado", selection: $viewModel.selectedPopulatedCenter) {
                        Text("Centro Poblado").tag(nil as CentroPoblado?)
                        ForEach(provider.centrosPoblados) { centroPoblado in
                            Text(centroPoblado.name).tag(centroPoblado as CentroPoblado?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            Task {
                try? await viewModel.fetchDepartamentos()
            }
        }
    }
    
}

struct CardView: View {
    var title: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
            Spacer()
            Toggle(isOn: $isOn) {
                Text("")
            }
            .onChange(of: isOn) { newValue in
                
                if newValue {
                    
                } else {
                    
                }
            }
            .labelsHidden()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
    private func activateTask() {
        print("Task Activated")
    }
    
    private func deactivateTask() {
        print("Task Deactivated")
    }
    
}

//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            NotificationSettingsView()
//                .environmentObject(QuakesProvider(client: QuakeClient(downloader: TestDownloader())))
//        }
//    }


