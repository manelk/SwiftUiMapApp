//
//  LocationDetailView.swift
//  SwiftUiMapApp
//
//  Created by odc on 13/12/2024.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Monument name")
                    .font(.title)
                
                
                HStack {
                    Text("haja dunno what yet ")
                    Spacer()
                    Text("cityName")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                
                Divider()
                
                
                Text("About Monument name")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            
            Spacer()
        }
    }
}

#Preview {
    LocationDetailView()
}
