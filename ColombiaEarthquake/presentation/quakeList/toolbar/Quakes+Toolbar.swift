//
//  Quake+Toolbar.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//

import SwiftUI

extension Quakes {
    
    @ToolbarContentBuilder
    func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                showIntroduction = true
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.blue)
            }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(destination: SearchPlaceView()) {
                Text("Buscar Por Lugar")
                    .font(.headline)
            }
        }
        
        
        
        
        
        
        ToolbarItemGroup(placement: .bottomBar) {
            RefreshButton {
                Task {
                    await fetchQuakes()
                }
            }
            Spacer()
            ToolbarStatus(
                isLoading: isLoading,
                lastUpdated: lastUpdated,
                quakesCount: provider.quakes.count
            )
            Spacer()
            
            
        }
    }
}

