//
//  ToolbarStatus.swift
//  ColombiaEarthquake
//
//  Created by miguel angel bello garcia on 24/07/24.
//

import SwiftUI

struct ToolbarStatus: View {
    var isLoading: Bool
    var lastUpdated: TimeInterval
    var quakesCount: Int

    var body: some View {
        VStack {
            if isLoading {
                Text("Verificando terremotos...")
                Spacer()
            } else if lastUpdated == Date.distantFuture.timeIntervalSince1970 {
                Spacer()
                Text("\(quakesCount) Terremotos")
                    .foregroundStyle(Color.secondary)
            } else {
                let lastUpdatedDate = Date(timeIntervalSince1970: lastUpdated)
                Text("Actualizados \(lastUpdatedDate.formatted(.relative(presentation: .named)))")
                Text("\(quakesCount) Terremotos")
                    .foregroundStyle(Color.secondary)
            }
        }
        .font(.caption)
    }
}

struct ToolbarStatus_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarStatus(
            isLoading: true,
            lastUpdated: Date.distantPast.timeIntervalSince1970,
            quakesCount: 125
        )
        .previewLayout(.fixed(width: 200, height: 40))

        ToolbarStatus(
            isLoading: false,
            lastUpdated: Date.distantFuture.timeIntervalSince1970,
            quakesCount: 10_000
        )
        .previewLayout(.fixed(width: 200, height: 40))

        ToolbarStatus(
            isLoading: false,
            lastUpdated: Date.now.timeIntervalSince1970,
            quakesCount: 10_000
        )
        .previewLayout(.fixed(width: 200, height: 40))

        ToolbarStatus(
            isLoading: false,
            lastUpdated: Date.distantPast.timeIntervalSince1970,
            quakesCount: 10_000
        )
        .previewLayout(.fixed(width: 200, height: 40))

    }
}

