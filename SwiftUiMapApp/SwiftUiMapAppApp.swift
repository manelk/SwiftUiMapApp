//
//  SwiftUiMapAppApp.swift
//  SwiftUiMapApp
//
//  Created by odc on 11/12/2024.
//

import SwiftUI

@main
struct SwiftUiMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    let logger = Logger()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                Tab("Map", systemImage: "map.fill") {
                    LocationsView()
                        .environmentObject(vm)
                }
                Tab("List", systemImage: "list.bullet") {
                    ListLocationsView()
                        .environmentObject(vm)
                }
            }.onAppear{
                logger.log(text : "heelo")
            }
        }
    }
}


class Logger {
    
    func log(text : String){
        print(text)
    }
}
