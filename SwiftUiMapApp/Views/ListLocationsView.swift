//
//  ListLocationsView.swift
//  SwiftUiMapApp
//
//  Created by odc on 12/12/2024.
//

import SwiftUI

struct ListLocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @StateObject private var locationsDetailsViewModel = LocationsDetailsViewModel()
    
    // Used for testing
    @State private var showingCredits = false
    
    var body: some View {
        NavigationStack {
            List(vm.locations) { location in
                NavigationLink {
                    // here the LocationDetailView
                    LocationDetailView(id: location.id)
                } label: {
                    HStack {
                        Image(location.imageNames[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading) {
                            Text(location.cityName)
                            Text(location.name)
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                        }
                    }
                }
                .navigationTitle("List of monuments")
                
            }.onAppear {}
        }
        
    }
}

#Preview {
    ListLocationsView()
        .environmentObject(LocationsViewModel())
}
