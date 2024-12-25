//
//  ContentView.swift
//  SwiftUiMapApp
//
//  Created by odc on 11/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: LocationsView()) {
                Text("LocationsView")
            }
            .navigationTitle("Navigation")
        }
        
    }
}

#Preview {
    ContentView()
}
