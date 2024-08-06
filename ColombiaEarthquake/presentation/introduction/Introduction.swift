//
//  Introduction.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 1/08/24.
//

import SwiftUI

struct IntroductionView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("Bienvenido a Terremotos Colombia")
                .font(.largeTitle)
                .padding()

            Text("En esta app podras ver los ultimos terremotos reportados en Colombia. Los datos son proporcionados por el servicio geologico colombiano, sin embargo esta app no hace parte del mismo, es una aplicacion independiente.")
                .padding()
            
            Spacer()

            Button(action: {
                isPresented = false
            }) {
                Text("Comenzar")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Link("Privacy Policy", destination: URL(string: "https://www.termsfeed.com/live/235d904d-a797-47e3-80b3-1d4a66e9dd04")!)
                            .font(.body)
                            .padding()
        }
    }
}
struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(isPresented: .constant(true))
    }
}
