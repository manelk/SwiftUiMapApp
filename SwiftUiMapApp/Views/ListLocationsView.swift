//
//  ListLocationsView.swift
//  SwiftUiMapApp
//
//  Created by odc on 12/12/2024.
//

import SwiftUI

struct ListLocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @State private var showingCredits = false
    
    var body: some View {
        
        NavigationSplitView {
            List(vm.locations){ location in
                NavigationLink {
                    LocationDetailView()
                } label: {
                    HStack{
                        Image(location.imageNames[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading){
                            Text(location.cityName)
                            Text(location.name)
                                .font(. system(size: 24))
                                .fontWeight(.bold)
                        }
                    }
                }
                .navigationTitle("List of monuments")
                
            }
        } detail: {
            Text("Select a monument")
        }
        
        //
        //        VStack{
        //            List{
        //                ForEach(vm.locations){ data in
        //                    HStack{
        //
        //                        Image(data.imageNames[0])
        //                            .resizable()
        //                            .aspectRatio(contentMode: .fit)
        //                            .frame(width: 100, height: 100)
        //                            .cornerRadius(20)
        //
        //
        //                        VStack(alignment: .leading){
        //                            Text(data.cityName)
        //                            Text(data.name)
        //                                .font(. system(size: 24))
        //                                .fontWeight(.bold)
        //
        //
        //
        //                            //                            Link("Check Wikipedia Link", destination: URL(string: data.link)!)
        //                            //
        //                            //                            Button("Show Credits") {
        //                            //                                showingCredits.toggle()
        //                            //                            }
        //                            //                            .sheet(isPresented: $showingCredits) {
        //                            //                                Text("Hello")
        //                            //                                    .presentationDetents([.medium, .large])
        //                            //                            }
        //                        }
        //
        //
        //
        //                    }
        //                }
        //            }
        //        }
    }
}

#Preview {
    ListLocationsView()
        .environmentObject(LocationsViewModel())
    
}
