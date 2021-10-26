//
//  GeocoderManager.swift
//  Location
//
//  Created by Sun on 26/10/2021.
//

import CoreLocation

protocol GeocoderManagerType {
    typealias AdressHandler = (String, Error?) -> Void
    func getAddress(from location: CLLocation, completion: @escaping AdressHandler)
}

final class GeocoderManager: GeocoderManagerType {
    
    static let shared = GeocoderManager()
    private let geocoder = CLGeocoder()
    
    private init() { }
    
    func getAddress(from location: CLLocation, completion: @escaping AdressHandler) {
        geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            if let placemarks = placemarks, placemarks.count > 0 {
                let firstPlacemark = placemarks[0]
                
                var addressString = ""
                
                if let subThoroughfare = firstPlacemark.subThoroughfare {
                    addressString = addressString + subThoroughfare + " "
                }
                
                if let thoroughfare = firstPlacemark.thoroughfare {
                    addressString = addressString + thoroughfare + " "
                }
                
                if let subLocality = firstPlacemark.subLocality {
                    addressString = addressString + subLocality + " "
                }
                
                if let subAdministrativeArea = firstPlacemark.subAdministrativeArea {
                    addressString = addressString + subAdministrativeArea + " "
                }
                
                if let administrativeArea = firstPlacemark.administrativeArea {
                    addressString = addressString + administrativeArea + " "
                }

                if let country = firstPlacemark.country {
                    addressString = addressString + country + " "
                }
                
                if let postalCode = firstPlacemark.postalCode {
                    addressString = addressString + postalCode
                }
                completion(addressString, nil)
            }
        })
    }
}
