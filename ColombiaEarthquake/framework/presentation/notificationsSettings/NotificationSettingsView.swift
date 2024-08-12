//
//  NotificationSettingsView.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 6/08/24.
//

import SwiftUI

struct NotificationSettingsView: View {
    @AppStorage("lastEarthQuakeByPlaceId") private var lastEarthQuakeByPlaceId: String = "empty"
    @AppStorage("placeOfEarthquake") private var placeOfEarthquake: String = ""
    @AppStorage("NotificationByPlaceIsOn") private var NotificationByPlaceIsOn: Bool = false
    
    @AppStorage("isBackgroundFetchEnabled") private var isBackgroundFetchEnabled: Bool = false
    @AppStorage("populatedCenterId") private var populatedCenterId: String = ""
    
    @State private var toggle1: Bool = false
    
    @State private var selectedMagnitude: String = "Seleccionar"
    
    @StateObject private var viewModel: NotificationsSettingsViewModel
    @EnvironmentObject var provider: QuakesProvider
    
    @State private var showAlert = false
    @State private var isConditionTrue = false
    
    
    init(provider: QuakesProvider) {
        _viewModel = StateObject(wrappedValue: NotificationsSettingsViewModel(
            fetchDepartamentsUseCase: FetchDepartamentsUseCase(provider: provider),
            fetchMunicipalityUseCase: FetchMunicipalityUseCase(provider: provider),
            fetchPopulatedCenterUseCase: FetchPopulatedCenterUseCase(provider: provider),
            fetchQuakeByPlaceUseCase: FetchQuakesByPlaceUseCase(provider: provider)
        )
        )
    }
    
    
    
    let MagnitudeLastEarthQuake = ["Seleccionar","2.0 a 2.5", "2.5 a 3.0", "3.0 a 3.5", "3.5 a 4.0","4.0 a 4.5", "4.5 a 5.0", "Mayor a 5.0"]
    
    
    var body: some View {
        
        VStack{
            if viewModel.isLoading {
                ProgressView()  // Animación de carga
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .padding(.vertical, 20)
                Spacer()
                
            }
            if viewModel.isErrorLoading{
                Text("Lo sentimos hay un error en este momento, Puedes intentarlo mas tarde")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(5)
                Spacer()
                
            }
            if !viewModel.isLoading && !viewModel.isErrorLoading{
                
                
                
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
                        Toggle(isOn: $isBackgroundFetchEnabled) {
                            Text("")
                        }
                        .onChange(of: isBackgroundFetchEnabled) { value in
                            if value {
                                if(viewModel.selectedPopulatedCenter == nil){
                                    showAlert=true
                                    isBackgroundFetchEnabled=false
                                }else{
                                    Task{
                                        await viewModel.fetchQuakesByPlace()
                                        lastEarthQuakeByPlaceId=viewModel.quakesByPlaces.first?.id ?? "empty"
                                        print("last EarthQuake by place is: \(lastEarthQuakeByPlaceId) : last eartquake id")
                                    }
                                }
                            }else{
                                lastEarthQuakeByPlaceId="empty"
                            }
                            
                        }
                        .labelsHidden()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading){
                        Text("Notificacion activa en el Centro Poblado:")
                            .bold()
                        Text("Centro Poblado")
                    }.isHidden(!isBackgroundFetchEnabled)
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
                                        viewModel.selectedPopulatedCenter=nil
                                        viewModel.selectedMunicipality=nil
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
                                if municipio != nil {
                                    viewModel.selectedPopulatedCenter=nil
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
                            .onChange(of: viewModel.selectedPopulatedCenter) { centropoblado in
                                if centropoblado != nil {
                                    Task {
                                        placeOfEarthquake=centropoblado?.id ?? ""
                                    }
                                }
                            }
                        }
                        
                    }.isHidden(isBackgroundFetchEnabled)
                    
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle("Configurar notificaciones")
        .onAppear {
            Task {
                try? await viewModel.fetchDepartamentos()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Debes seleccionar un centro poblado"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
}

extension NotificationSettingsView{
    
    
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


