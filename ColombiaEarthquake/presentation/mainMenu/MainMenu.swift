//
//  MainMenu.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 6/08/24.
//

import Foundation
import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var provider: QuakesProvider
    
    var body: some View {
        
        VStack {
            Spacer()
            NavigationLink(destination: QuakesList()) {
                Text("Ver Ultimos Terremotos")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            NavigationLink(destination: SearchPlaceView(provider:provider)) {
                Text("Buscar Terremoto Por Lugar")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
            
            NavigationLink(destination: NotificationSettingsView(provider:provider)) {
                Text("Configurar notificaciones")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }.navigationTitle("Menu Principal")
        
    }
}
struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
