//
//  SearchPlace.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import SwiftUI

struct SearchPlaceView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: SearchPlaceViewModel
    @EnvironmentObject var provider: QuakesProvider
    
    
    init(provider: QuakesProvider) {
        _viewModel = StateObject(wrappedValue: SearchPlaceViewModel(
            fetchDepartamentsUseCase: FetchDepartamentsUseCase(provider: provider),
            fetchMunicipalityUseCase: FetchMunicipalityUseCase(provider: provider),
            fetchPopulatedCenterUseCase: FetchPopulatedCenterUseCase(provider: provider)
        )
        )
    }
    
    
    
    let populatedCenters = ["Centro Poblado 1", "Centro Poblado 2", "Centro Poblado 3"]
    
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
                VStack(alignment: .leading, spacing: 20) {
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
                        .padding()
                        
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
                        .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: PlaceEarthquake(centroPobladoId: viewModel.selectedPopulatedCenter?.id ?? "0",centroPobladoName: viewModel.selectedPopulatedCenter?.name ?? "No Name")) {
                        Text("Ver Terremotos")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.selectedPopulatedCenter != nil ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(viewModel.selectedPopulatedCenter == nil)
                    .padding()
                }
                
                
                
            }
        }
        .padding()
        .navigationTitle("Buscar Lugar")
        .onAppear {
            Task {
                try? await viewModel.fetchDepartamentos()
            }
        }
        
    }
}




