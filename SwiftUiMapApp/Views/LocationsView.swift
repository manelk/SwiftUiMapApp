//
//  LocationsView.swift
//  SwiftUiMapApp
//
//  Created by odc on 12/12/2024.
//

import SwiftUI
import MapKit

// ---------- THE VIEW
struct LocationsView: View {
    // creation of a LocationsViewModel instance called vm
    // this instance is of type @StateObject
    // We use @StateObject to create and own a persistent instance of the view model in a View, ensuring it updates the UI when its @Published properties change.
    // @StateObject private var vm = LocationsViewModel()
    
    // we reference the EnvironmentObject already created
    @EnvironmentObject private var vm: LocationsViewModel
    
    
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude:41.8902, longitude: 12.4922),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    ))
    

    
    var body: some View {
        //         code to see the vm.locations
        Text("Hey")
            .onAppear {
                print("VM", vm.locations)
            }
        //        List{
        //            ForEach(vm.locations){ item in
        //                Text(item.name)
        //            }
        //        }
        if(vm.locations.isEmpty){
            ProgressView()
        }
        
        else{
            ZStack{
                Map(position: $cameraPosition){
                    ForEach(vm.locations){
                        Marker($0.name, coordinate: $0.coordinates)
                    }
                }
            }
        }
        
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
