//
//  LocationsDetailsViewModel.swift
//  SwiftUiMapApp
//
//  Created by odc on 13/12/2024.
//

import Foundation
class LocationsDetailsViewModel: ObservableObject{
    
    @Published var location: Location
    @Published var locations: [Location]
    @Published var filtredLocations: [Location]
    
    init(){
        self.location = LocationsDataService.locations[0]
        self.locations = LocationsDataService.locations
        self.filtredLocations = []
    }
    
    func getLocationById(id: UUID) {
        let filteredLocation = locations.filter { $0.id == id }
        location = filteredLocation[0]
    }
    
    
}
