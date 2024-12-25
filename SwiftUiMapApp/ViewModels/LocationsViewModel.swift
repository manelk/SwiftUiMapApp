//
//  LocationsViewModel.swift
//  SwiftUiMapApp
//
//  Created by odc on 12/12/2024.
//

import Foundation
import MapKit

class LocationsViewModel: ObservableObject{

    @Published var locations: [Location]
    
    init(){
        self.locations = LocationsDataService.locations
    }
    
    
   
        
}
