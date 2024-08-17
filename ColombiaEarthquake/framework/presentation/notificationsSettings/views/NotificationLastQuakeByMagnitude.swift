//
//  NotificationLastQuakeMagnitude.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 16/08/24.
//

import SwiftUI

extension NotificationSettingsView{
    
     
    struct NotificationLastQuakeByMagnitude:View {
        let MagnitudeLastEarthQuake = ["Seleccionar","2.0 a 2.5", "2.5 a 3.0", "3.0 a 3.5", "3.5 a 4.0","4.0 a 4.5", "4.5 a 5.0", "Mayor a 5.0"]
        
        
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
            
        }
    }
    
    
    
    
    
}
