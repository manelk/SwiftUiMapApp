//
//  CircleView.swift
//  SwiftUiMapApp
//
//  Created by odc on 13/12/2024.
//

import SwiftUI


struct CircleImage: View {
    var image: Image


    var body: some View {
        image
            .resizable()
            
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .padding(20)
        

    }
}


#Preview {
    CircleImage(image: Image("paris-eiffeltower-1"))
}
