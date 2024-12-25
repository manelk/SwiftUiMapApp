//
//  MonumentsListView.swift
//  SwiftUiMapApp
//
//  Created by odc on 22/12/2024.
//

import SwiftUI
import MapKit

struct MonumentsListView: View {
    
    @StateObject var locationsViewModel = LocationsViewModel()
    
    var body: some View {
        VStack{
            List{
                ForEach(locationsViewModel.locations){ data in
                    HStack{
                        
                        Image(data.imageNames[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading){
                            Text(data.cityName)
                            Text(data.name)
                                .font(. system(size: 24))
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    MonumentsListView()
}
