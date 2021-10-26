//
//  LocationManager.swift
//  Location
//
//  Created by Sun on 26/10/2021.
//

import CoreLocation

final class LocationManager: NSObject {
    
    // MARK: - Define
    typealias LocationHandler = (CLLocationCoordinate2D) -> Void
    
    // MARK: - Property
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    var passLocation: LocationHandler?
    
    // MARK: - Init
    private override init() {
        super.init()
        setupLocation()
    }    

    // MARK: - Setup
    private func setupLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

// MARK: - Delegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {
            return
        }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        passLocation?(locValue)
    }
}
