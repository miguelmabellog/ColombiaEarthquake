//
//  SearchPlace.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import SwiftUI

struct SearchPlaceView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var provider: QuakesProvider
    
    @State private var selectedDepartment: Departamento? = nil
    @State private var selectedMunicipality: Municipio? = nil
    @State private var selectedPopulatedCenter: CentroPoblado? = nil
    
    let populatedCenters = ["Centro Poblado 1", "Centro Poblado 2", "Centro Poblado 3"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                Text("Departamento")
                    .font(.headline)
                
                Picker("Departamento", selection: $selectedDepartment) {
                    Text("Selecciona un Departamento").tag(nil as Departamento?)
                    ForEach(provider.departamentos) { department in
                        Text(department.name).tag(department as Departamento?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .onChange(of: selectedDepartment) { department in
                    if let department = department {
                        Task {
                            try? await provider.fetchMunicipios(for: Int(department.id) ?? 0)
                        }
                    }
                }
            }
            .padding()

            VStack(alignment: .leading) {
                Text("Municipio")
                    .font(.headline)
                
                Picker("Municipios", selection: $selectedMunicipality) {
                    Text("Selecciona un Municipio").tag(nil as Municipio?)
                    ForEach(provider.municipios) { municipio in
                        Text(municipio.name).tag(municipio as Municipio?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .onChange(of: selectedMunicipality) { municipio in
                    if let municipio = municipio {
                        Task {
                            try? await provider.fetchCentrosPoblados(for: Int(municipio.id) ?? 0)
                        }
                    }
                }
            }
            .padding()

            VStack(alignment: .leading) {
                Text("Centro Poblado")
                    .font(.headline)
                
                Picker("Centro Poblado", selection: $selectedPopulatedCenter) {
                    Text("Centro Poblado").tag(nil as CentroPoblado?)
                    ForEach(provider.centrosPoblados) { centroPoblado in
                        Text(centroPoblado.name).tag(centroPoblado as CentroPoblado?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()

            Spacer()
            
            NavigationLink(destination: PlaceEarthquake(centroPobladoId: selectedPopulatedCenter?.id ?? "0",centroPobladoName: selectedPopulatedCenter?.name ?? "No Name", showIntroduction: .constant(false))) {
                            Text("Ver Terremotos")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(selectedPopulatedCenter != nil ? Color.blue : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .disabled(selectedPopulatedCenter == nil)
                        .padding()
            
            
        }
        .padding()
        .navigationTitle("Buscar Lugar")
        .task {
            try? await provider.fetchDepartamentos()
        }
    }
}

struct SearchPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchPlaceView()
        }
    }
}
