//
//  LocationsView.swift
//  SwiftUiMapApp
//
//  Created by odc on 12/12/2024.
//

import SwiftUI
import MapKit
import Photos

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @StateObject private var locationManager = LocationManagerViewModel()
    
    @State private var centerVar: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude:41.8902, longitude: 12.4922),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    ))
    
    var body: some View {
        
        if(vm.locations.isEmpty){
            ProgressView()
        }
        
        else{
            ZStack{
                Map(position: $cameraPosition){
                    ForEach(vm.locations){ item in
                        Marker(item.name, coordinate: item.coordinates)
                    }
                }
            }.onAppear(){
                locationManager.checkLocationAuthorization()
                
                centerVar = locationManager.lastKnownLocation ?? CLLocationCoordinate2D(latitude:41.8902, longitude: 12.4922)
                
                cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
                    center: centerVar,
                    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                ))
            }
        }
    }
    
}


#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
