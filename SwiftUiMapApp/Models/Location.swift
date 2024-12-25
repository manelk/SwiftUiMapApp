//
//  Location.swift
//  SwiftUiMapApp
//
//  Created by odc on 11/12/2024.
//

import Foundation
import MapKit

struct Location: Identifiable{
    let name: String
    let cityName:String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    let id = UUID()
}
