//
//  NotificationSettingsView.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 6/08/24.
//

import SwiftUI

struct NotificationSettingsView: View {
    @State private var toggle1: Bool = false
    @StateObject private var viewModel: NotificationsSettingsViewModel
    
    init(notificationSittingsViewModel:NotificationsSettingsViewModel) {
        _viewModel = StateObject(wrappedValue: notificationSittingsViewModel)
    }
    
    
    private let MagnitudeLastEarthQuake = ["Seleccionar","2.0 a 2.5", "2.5 a 3.0", "3.0 a 3.5", "3.5 a 4.0","4.0 a 4.5", "4.5 a 5.0", "Mayor a 5.0"]
    
    
    var body: some View {
        
        VStack{
            if viewModel.state.isLoading {
                ProgressView()  // Animación de carga
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .padding(.vertical, 20)
                Spacer()
                
            }
            if viewModel.state.isErrorLoading{
                Text("Lo sentimos hay un error en este momento, Puedes intentarlo mas tarde")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(5)
                Spacer()
                
            }
            if !viewModel.state.isLoading && !viewModel.state.isErrorLoading{
                
                
                
                VStack(alignment: .leading) {
                   
                    VStack(alignment: .leading) {
                        Text("Magnitud")
                            .font(.headline)
                        
                        Picker("Magnitud", selection: ) {
                            ForEach(MagnitudeLastEarthQuake, id: \.self) { magnitude in
                                Text(magnitude).tag(magnitude)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Spacer()
                    Divider()
                    NotificationQuakeByPlaceView()
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle("Configurar notificaciones")
        .onAppear {
            Task {
                
            }
        }
//        .alert(isPresented: false) {
//            Alert(
//                title: Text("Debes seleccionar un centro poblado"),
//                dismissButton: .default(Text("OK"))
//            )
//        }
    }
    
}

extension NotificationSettingsView{
    
    struct NotificationQuakeByPlaceView:View {
        var body: some View {
            HStack {
                Text("Notificacion Por Lugar")
                    .font(.title)
                Spacer()
                Toggle(isOn: false) {
                    Text("")
                }
                .onChange(of: ) { value in
                    if value {
                        if(){
                            
                        }else{
                            Task{
                                
                            }
                        }
                    }else{
                        
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
            }.isHidden(false)
            VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading) {
                Text("Departamento")
                    .font(.headline)
                
                Picker("Departamento", selection: $viewModel.selectedDepartment) {
                    Text("Selecciona un Departamento").tag(nil as Departament?)
                    ForEach() { department in
                        Text(department.name).tag(department as Departament?)
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
                    Text("Selecciona un Municipio").tag(nil as Municipality?)
                    ForEach() { municipio in
                        Text(municipio.name).tag(municipio as Municipality?)
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
                    Text("Centro Poblado").tag(nil as PopulatedCenter?)
                    ForEach() { centroPoblado in
                        Text(centroPoblado.name).tag(centroPoblado as PopulatedCenter?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .onChange(of: viewModel.selectedPopulatedCenter) { centropoblado in
                    if centropoblado != nil {
                        Task {
                            
                        }
                    }
                }
            }
            
        }.isHidden(false)
        }
    }
    
    
    
    
    
}

extension NotificationSettingsView{
    
    struct NotificationLastQuakeMagnitude:View {
        var body: some View {
            HStack {
                Text("Notificacion Ultimo Terremoto Por Magnitud")
                    .font(.title)
                Spacer()
                Toggle(isOn: false) {
                    Text("")
                }
                .onChange(of: ) { value in
                    if value {
                        if(){
                            
                        }else{
                            Task{
                                
                            }
                        }
                    }else{
                        
                    }
                    
                }
                .labelsHidden()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            
        }
    }
    
    
    
    
    
}




