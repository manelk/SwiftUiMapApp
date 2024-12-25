//
//  LocationDetailView.swift
//  SwiftUiMapApp
//
//  Created by odc on 13/12/2024.
//

import MapKit
import SwiftUI

struct LocationDetailView: View {
    @StateObject private var locationsDetailsViewModel = LocationsDetailsViewModel()
    
    var id: UUID
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                
                MapView(coordinate: locationsDetailsViewModel.location.coordinates)
                    .frame(height: 300)
                
                VStack(alignment: .leading) {
                    Text(locationsDetailsViewModel.location.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(locationsDetailsViewModel.location.cityName)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text("About Monument \(locationsDetailsViewModel.location.name)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(locationsDetailsViewModel.location.description)
                    Divider()
                    
                    Text("Discover pictures of the monument")
                        .font(.title2)
                        .fontWeight(.bold)
                    CarouselView(imagesTable: ["rome-colosseum-1", "rome-colosseum-2", "rome-colosseum-3",])
                        .frame(height: 300)
                    
                    Link("Check the Wikipedia link", destination: URL(string: locationsDetailsViewModel.location.link)!)
                        .font(.title)
                           .foregroundStyle(.red)

                }
                .padding()
            }
            
        }.onAppear {
            locationsDetailsViewModel.getLocationById(id: id)
        }
    }
}

#Preview {
    @Previewable @StateObject var locationsDetailsViewModel = LocationsDetailsViewModel()
    LocationDetailView(id: locationsDetailsViewModel.location.id)
}
