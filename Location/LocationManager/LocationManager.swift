//
//  LocationManager.swift
//  Location
//
//  Created by Sun on 26/10/2021.
//

import CoreLocation

final class LocationManager: NSObject {
    
    // MARK: - Define
    typealias LocationHandler = (String, Int) -> Void
    
    // MARK: - Property
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    var passLocation: LocationHandler?
    private let geocoderManager = GeocoderManager.shared
    var count = 0
    
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
    
    private func getAdress(location: CLLocation) {
        geocoderManager.getAddress(from: location) { [weak self] adress, error in
            guard let self = self else { return }
            self.count += 1
            self.passLocation?(adress, self.count)
        }
    }
}

// MARK: - Delegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location else { return }
        getAdress(location: location)
    }
}
