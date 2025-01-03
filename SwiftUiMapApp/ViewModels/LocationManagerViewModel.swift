//
//  LocationManager.swift
//  SwiftUIMap
//
//  Created by odc on 25/12/2024.
//

import Foundation
import CoreLocation

final class LocationManagerViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    //used to store the user location
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    
    // will allow get access to location services.
    var manager = CLLocationManager()
    
    func checkLocationAuthorization() {
        
        manager.delegate = self
        manager.startUpdatingLocation()
        
        switch manager.authorizationStatus {
        case .notDetermined://The user choose allow or denny your app to get the location yet
            manager.requestWhenInUseAuthorization()
            
        case .restricted://The user cannot change this app’s status, possibly due to active restrictions such as parental controls being in place.
            print("Location restricted")
            
        case .denied://The user dennied your app to get location or disabled the services location or the phone is in airplane mode
            print("Location denied")
            
        case .authorizedAlways://This authorization allows you to use all location services and receive location events whether or not your app is in use.
            print("Location authorizedAlways")
            
        case .authorizedWhenInUse://This authorization allows you to use all location services and receive location events only when your app is in use
            print("Location authorized when in use")
            lastKnownLocation = manager.location?.coordinate
            
        @unknown default:
            print("Location service disabled")
            
        }
    }
    
    //Trigged every time authorization status changes : came from the protocol CLLocationManagerDelegate
    // https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("Authorization status changes")
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}
