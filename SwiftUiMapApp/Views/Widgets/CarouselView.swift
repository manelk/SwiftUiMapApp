//
//  CarouselView.swift
//  SwiftUiMapApp
//
//  Created by odc on 23/12/2024.
//

import SwiftUI

struct CarouselView: View {
    var imagesTable: [String]
    
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing:0){
            TabView(selection:$currentIndex){
                ForEach(0..<imagesTable.count,id: \.self){ imageIndex in
                    Image(imagesTable[imageIndex])
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        
                        .clipped()
                        .tag(imageIndex)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .onReceive(timer){_ in
            withAnimation {
                currentIndex = (currentIndex + 1) % imagesTable.count
            }
        }
    }
}

#Preview {
    CarouselView(imagesTable: ["rome-colosseum-1", "rome-colosseum-2", "rome-colosseum-3",])
}
